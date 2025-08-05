<%-- 
    Document   : add-user
    Created on : 16 Jul 2025, 16:28:53
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="com.pahana.pahanaedubookshopbilling.service.UserService" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>

<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || !"admin".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    String msg = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // pass raw password
        user.setRole(role);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setStatus("active");
        user.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));

        UserService userService = new UserService();
        boolean inserted = userService.createUser(user);

        if (inserted) {
            response.sendRedirect("user-management.jsp?msg=User added successfully!");
            return;
        } else {
            msg = "Error: Username/email may already exist or DB issue.";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Add User - Pahana Edu Bookshop Billing</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Font Awesome -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Dashboard Themed CSS -->

        <link href="styles/dashboard.css" rel="stylesheet" />

        <style>

            /* Button Styles for Dark Theme */

            :root {
                --primary-color: #273F4F;
                --primary-hover: #1a2b36;
                --light-color: #EFEEEA;
                --danger-color: #dc2626;
                --danger-hover: #b91c1c;
                --success-color: #059669;
                --success-hover: #047857;
                --warning-color: #d97706;
                --warning-hover: #b45309;
                --secondary-color: #6b7280;
                --secondary-hover: #4b5563;
                --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }

            /* Primary Button */

            .btn-primary {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
            }

            .btn-primary:hover {
                background: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(39, 63, 79, 0.4);
            }

            .btn-primary:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            .btn-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.5);
            }

            /* Outline Primary Button */

            .btn-outline-primary {
                color: var(--primary-color);
                border-color: var(--primary-color);
                background: transparent;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                border-width: 2px;
            }

            .btn-outline-primary:hover {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(39, 63, 79, 0.4);
            }

            .btn-outline-primary:active {
                transform: translateY(0);
                background: var(--primary-hover);
                border-color: var(--primary-hover);
            }

            .btn-outline-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.5);
            }

            /* Danger Button */

            .btn-danger {
                background: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
            }

            .btn-danger:hover {
                background: var(--danger-hover);
                border-color: var(--danger-hover);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(220, 38, 38, 0.4);
            }

            .btn-danger:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            .btn-danger:focus {
                box-shadow: 0 0 0 0.2rem rgba(220, 38, 38, 0.5);
            }

            /* Success Button */

            .btn-success {
                background: var(--success-color);
                border-color: var(--success-color);
                color: white;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
            }

            .btn-success:hover {
                background: var(--success-hover);
                border-color: var(--success-hover);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(5, 150, 105, 0.4);
            }

            .btn-success:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            .btn-success:focus {
                box-shadow: 0 0 0 0.2rem rgba(5, 150, 105, 0.5);
            }

            /* Warning Button */

            .btn-warning {
                background: var(--warning-color);
                border-color: var(--warning-color);
                color: white;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
            }

            .btn-warning:hover {
                background: var(--warning-hover);
                border-color: var(--warning-hover);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(217, 119, 6, 0.4);
            }

            .btn-warning:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            .btn-warning:focus {
                box-shadow: 0 0 0 0.2rem rgba(217, 119, 6, 0.5);
            }

            /* Secondary Button */

            .btn-secondary {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
            }

            .btn-secondary:hover {
                background: var(--secondary-hover);
                border-color: var(--secondary-hover);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(107, 114, 128, 0.4);
            }

            .btn-secondary:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            .btn-secondary:focus {
                box-shadow: 0 0 0 0.2rem rgba(107, 114, 128, 0.5);
            }

            /* Outline Secondary Button */

            .btn-outline-secondary {
                color: var(--secondary-color);
                border-color: var(--secondary-color);
                background: transparent;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                border-width: 2px;
            }

            .btn-outline-secondary:hover {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(107, 114, 128, 0.4);
            }

            .btn-outline-secondary:active {
                transform: translateY(0);
                background: var(--secondary-hover);
                border-color: var(--secondary-hover);
            }

            .btn-outline-secondary:focus {
                box-shadow: 0 0 0 0.2rem rgba(107, 114, 128, 0.5);
            }

            /* Small Button Sizes */

            .btn-sm {
                padding: 0.5rem 1rem;
                font-size: 0.875rem;
                border-radius: 0.5rem;
            }

            /* Large Button Sizes */

            .btn-lg {
                padding: 1rem 2rem;
                font-size: 1.125rem;
                border-radius: 1rem;
            }

            /* Disabled Button State */

            .btn:disabled,
            .btn.disabled {
                opacity: 0.6;
                cursor: not-allowed;
                transform: none !important;
                box-shadow: none !important;
            }

            /* Loading State */

            .btn.btn-loading {
                pointer-events: none;
                opacity: 0.8;
            }

            .btn.btn-loading .spinner-border {
                width: 1rem;
                height: 1rem;
                border-width: 0.125rem;
            }

            /* Button Group Styles */

            .btn-group .btn {
                border-radius: 0;
            }

            .btn-group .btn:first-child {
                border-top-left-radius: 0.75rem;
                border-bottom-left-radius: 0.75rem;
            }

            .btn-group .btn:last-child {
                border-top-right-radius: 0.75rem;
                border-bottom-right-radius: 0.75rem;
            }

            /* Icon Button Styles */

            .btn i {
                transition: transform 0.3s ease;
            }

            .btn:hover i {
                transform: scale(1.1);
            }

            /* Responsive Button Styles */

            @media (max-width: 768px) {
                .btn {
                    padding: 0.65rem 1.25rem;
                    font-size: 0.9rem;
                }

                .btn-sm {
                    padding: 0.4rem 0.8rem;
                    font-size: 0.8rem;
                }

                .btn-lg {
                    padding: 0.875rem 1.75rem;
                    font-size: 1rem;
                }
            }

            /* Special Button Styles for Forms */

            .btn.w-100 {
                width: 100% !important;
            }

            .btn + .btn {
                margin-left: 0.5rem;
            }

            /* Floating Action Button Style */

            .btn-fab {
                width: 3.5rem;
                height: 3.5rem;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.25rem;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                position: fixed;
                bottom: 2rem;
                right: 2rem;
                z-index: 1000;
            }

            .btn-fab:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            }
        </style>
    </head>
    <body>

        <!-- Navigation Bar (from dashboard.jsp) -->

        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="admin/dashboard.jsp">
                    <i class="fas fa-book-open me-2"></i>
                    Pahana Edu
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="user-management.jsp"><i class="fas fa-users me-1"></i> Users</a></li>
                        <li class="nav-item"><a class="nav-link" href="customer-management.jsp"><i class="fas fa-user-friends me-1"></i> Customers</a></li>
                        <li class="nav-item"><a class="nav-link" href="item-management.jsp"><i class="fas fa-boxes me-1"></i> Book Store</a></li>
                        <li class="nav-item"><a class="nav-link" href="new-bill.jsp"><i class="fas fa-file-invoice me-1"></i> Billing</a></li>
                        <li class="nav-item"><a class="nav-link" href="bill-history.jsp"><i class="fas fa-file-invoice me-1"></i> Bills</a></li>
                        <li class="nav-item"><a class="nav-link" href="bill-report.jsp"><i class="fas fa-chart-bar me-1"></i> Reports</a></li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle user-dropdown" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle me-2"></i>
                                <%= currentUser.getName() %>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li class="dropdown-header">
                                    <div class="d-flex flex-column">
                                        <span class="fw-bold"><%= currentUser.getName() %></span>
                                        <small class="text-muted"><%= currentUser.getUsername() %></small>
                                    </div>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="profile.jsp"><i class="fas fa-user me-2"></i>Profile</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-bell me-2"></i>Notifications</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="#" id="logoutBtn"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->

        <div class="main-content d-flex justify-content-center align-items-center" style="min-height:80vh;">
            <div class="dashboard-card" style="max-width: 430px; width:100%;">
                <div class="mb-4 text-center">
                    <h2 class="add-user-title">
                        <i class="fas fa-user-plus"></i>
                        Add New User
                    </h2>
                </div>

                <a href="user-management.jsp" class="btn btn-outline-primary mb-3 w-100">
                    <i class="fas fa-arrow-left me-2"></i>Back to User Management
                </a>

                <% if (!msg.isEmpty()) { %>
                <div class="alert <%= msg.equals("User added!") ? "alert-success" : "alert-danger" %>">
                    <%= msg %>
                </div>
                <% } %>

                <form method="post" autocomplete="off" novalidate>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" id="username" name="username" class="form-control" required autofocus />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                            <input type="password" id="password" name="password" class="form-control" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-id-badge"></i></span>
                            <input type="text" id="name" name="name" class="form-control" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            <input type="text" id="phone" name="phone" class="form-control" required />
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="role" class="form-label">Role <span class="text-danger">*</span></label>
                        <select id="role" name="role" class="form-select" required>
                            <option value="" disabled selected>Select role</option>
                            <option value="cashier">Cashier</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-user-plus me-2"></i>Add User
                    </button>
                </form>
            </div>
        </div>

        <!-- Logout Confirmation Modal (same as dashboard) -->

        <div class="logout-confirm">
            <div class="logout-dialog">
                <h4><i class="fas fa-sign-out-alt me-2"></i>Confirm Logout</h4>
                <p>Are you sure you want to log out from Pahana Edu Bookshop? Your session will be ended.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-secondary cancel-logout">Cancel</button>
                    <button class="btn btn-danger confirm-logout">Logout</button>
                </div>
            </div>
        </div>

        <!-- Scroll to top button -->

        <div class="scroll-top">
            <i class="fas fa-arrow-up"></i>
        </div>

        <!-- Bootstrap JS -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JS: Copy from dashboard.jsp -->

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const scrollTopBtn = document.querySelector('.scroll-top');
                const logoutBtn = document.getElementById('logoutBtn');
                const logoutConfirm = document.querySelector('.logout-confirm');
                const cancelLogout = document.querySelector('.cancel-logout');
                const confirmLogout = document.querySelector('.confirm-logout');
                const navbar = document.querySelector('.navbar');

                // Scroll to top functionality

                window.addEventListener('scroll', function () {
                    if (window.pageYOffset > 300) {
                        scrollTopBtn.classList.add('active');
                    } else {
                        scrollTopBtn.classList.remove('active');
                    }
                    if (window.pageYOffset > 50) {
                        navbar.classList.add('scrolled');
                    } else {
                        navbar.classList.remove('scrolled');
                    }
                });

                scrollTopBtn.addEventListener('click', function () {
                    window.scrollTo({top: 0, behavior: 'smooth'});
                });

                // Logout confirmation

                logoutBtn.addEventListener('click', function (e) {
                    e.preventDefault();
                    logoutConfirm.classList.add('active');
                });

                cancelLogout.addEventListener('click', function () {
                    logoutConfirm.classList.remove('active');
                });

                confirmLogout.addEventListener('click', function () {
                    this.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Logging out...';
                    this.disabled = true;
                    setTimeout(() => {
                        window.location.href = 'logout.jsp';
                    }, 800);
                });

                logoutConfirm.addEventListener('click', function (e) {
                    if (e.target === this) {
                        logoutConfirm.classList.remove('active');
                    }
                });

                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && logoutConfirm.classList.contains('active')) {
                        logoutConfirm.classList.remove('active');
                    }
                });
            });
        </script>
    </body>
</html>
