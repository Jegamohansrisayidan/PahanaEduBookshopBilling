<%-- 
    Document   : edit-user
    Created on : 16 Jul 2025, 16:29:15
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="com.pahana.pahanaedubookshopbilling.dao.UserDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.service.UserService" %>

<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || !"admin".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    String msg = "";

    int userId = Integer.parseInt(request.getParameter("userId"));
    UserDAO dao = new UserDAO();
    User user = dao.getUserById(userId);

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        user.setUsername(request.getParameter("username"));
        user.setRole(request.getParameter("role"));
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setStatus(request.getParameter("status"));

        String newPassword = request.getParameter("password");

        UserService userService = new UserService();
        boolean updated;

        if (newPassword != null && !newPassword.trim().isEmpty()) {
            // Password changed - hash and update
            updated = userService.updateUserPassword(user, newPassword);
        } else {
            // No password change
            updated = dao.updateUser(user);
        }

        if (updated) {
            response.sendRedirect("user-management.jsp?msg=User updated successfully");
            return;
        } else {
            msg = "Update failed. Please try again.";
        }
    }
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Edit User - Pahana Edu Bookshop Billing</title>
        <link rel="icon" type="image/png" href="images/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Font Awesome -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Dashboard CSS -->

        <link href="styles/dashboard.css" rel="stylesheet" />
        <style>

            /* Button Styles for Edit User Page */

            :root {
                --primary-color: #273F4F;
                --primary-hover: #1a2b36;
                --light-color: #EFEEEA;
                --danger-color: #dc2626;
                --danger-hover: #b91c1c;
                --secondary-color: #6b7280;
                --secondary-hover: #4b5563;
                --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
                --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            }

            /* Primary Button - Update User */

            .btn-primary {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
                border: 2px solid var(--primary-color);
            }

            .btn-primary:hover {
                background: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: var(--shadow-lg);
            }

            .btn-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
                outline: none;
            }

            .btn-primary:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            /* Outline Primary Button - Back to User Management */

            .btn-outline-primary {
                color: var(--primary-color);
                border-color: var(--primary-color);
                background: transparent;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                border: 2px solid var(--primary-color);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
            }

            .btn-outline-primary:hover {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: var(--shadow-lg);
            }

            .btn-outline-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
                outline: none;
            }

            .btn-outline-primary:active {
                transform: translateY(0);
                background: var(--primary-hover);
                border-color: var(--primary-hover);
            }

            /* Secondary Button - Cancel */

            .btn-secondary {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
                border: 2px solid var(--secondary-color);
            }

            .btn-secondary:hover {
                background: var(--secondary-hover);
                border-color: var(--secondary-hover);
                color: white;
                transform: translateY(-2px);
                box-shadow: var(--shadow-lg);
            }

            .btn-secondary:focus {
                box-shadow: 0 0 0 0.2rem rgba(107, 114, 128, 0.25);
                outline: none;
            }

            /* Outline Secondary Button - Cancel in Modal */

            .btn-outline-secondary {
                color: var(--secondary-color);
                border-color: var(--secondary-color);
                background: transparent;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                border: 2px solid var(--secondary-color);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
            }

            .btn-outline-secondary:hover {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
                transform: translateY(-2px);
                box-shadow: var(--shadow-lg);
            }

            .btn-outline-secondary:focus {
                box-shadow: 0 0 0 0.2rem rgba(107, 114, 128, 0.25);
                outline: none;
            }

            /* Danger Button - Logout Confirm */

            .btn-danger {
                background: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-md);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
                border: 2px solid var(--danger-color);
            }

            .btn-danger:hover {
                background: var(--danger-hover);
                border-color: var(--danger-hover);
                color: white;
                transform: translateY(-2px);
                box-shadow: var(--shadow-lg);
            }

            .btn-danger:focus {
                box-shadow: 0 0 0 0.2rem rgba(220, 38, 38, 0.25);
                outline: none;
            }

            .btn-danger:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            /* Full Width Button */

            .btn.w-100 {
                width: 100% !important;
                justify-content: center;
            }

            /* Button Group Styles for Modal */

            .btn-group {
                display: flex;
                gap: 1rem;
                justify-content: flex-end;
                margin-top: 1.5rem;
            }

            .btn-group .btn {
                flex: 1;
                min-width: 100px;
                margin: 0;
            }

            /* Loading State */

            .btn.btn-loading {
                pointer-events: none;
                opacity: 0.8;
            }

            .btn.btn-loading i {
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            /* Disabled State */

            .btn:disabled,
            .btn.disabled {
                opacity: 0.5;
                cursor: not-allowed;
                transform: none !important;
                box-shadow: var(--shadow-sm) !important;
            }

            /* Icon Styles */

            .btn i {
                transition: transform 0.3s ease;
                margin-right: 0.5rem;
            }

            .btn:hover i {
                transform: scale(1.1);
            }

            .btn i:last-child {
                margin-right: 0;
                margin-left: 0.5rem;
            }

            /* Form Button Spacing */

            .btn + .btn {
                margin-top: 0.75rem;
            }

            .mb-3 + .btn {
                margin-top: 1rem;
            }

            /* Edit User Title Button Icon */

            .edit-user-title {
                font-size: 1.75rem;
                font-weight: 700;
                color: var(--primary-color);
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.75rem;
            }

            .edit-user-title i {
                font-size: 1.5rem;
                color: var(--primary-color);
            }

            /* Focus States for Accessibility */

            .btn:focus-visible {
                outline: 2px solid var(--primary-color);
                outline-offset: 2px;
            }

            /* Scroll to Top Button */

            .scroll-top {
                position: fixed;
                bottom: 2rem;
                right: 2rem;
                width: 3.5rem;
                height: 3.5rem;
                background: var(--primary-color);
                color: var(--light-color);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.25rem;
                cursor: pointer;
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-lg);
                z-index: 1000;
                border: none;
            }

            .scroll-top.active {
                opacity: 1;
                visibility: visible;
            }

            .scroll-top:hover {
                transform: translateY(-3px);
                background: var(--primary-hover);
                box-shadow: 0 8px 20px rgba(39, 63, 79, 0.4);
            }

            /* Responsive Design */

            @media (max-width: 768px) {
                .btn {
                    padding: 0.65rem 1.25rem;
                    font-size: 0.9rem;
                }

                .btn-group {
                    flex-direction: column;
                    gap: 0.5rem;
                }

                .btn-group .btn {
                    width: 100%;
                    margin-bottom: 0.5rem;
                }

                .edit-user-title {
                    font-size: 1.5rem;
                }

                .edit-user-title i {
                    font-size: 1.25rem;
                }
            }

            @media (max-width: 576px) {
                .btn {
                    padding: 0.6rem 1rem;
                    font-size: 0.875rem;
                }

                .scroll-top {
                    width: 3rem;
                    height: 3rem;
                    bottom: 1.5rem;
                    right: 1.5rem;
                    font-size: 1rem;
                }
            }

            /* Button hover effects enhancement */

            .btn {
                position: relative;
                overflow: hidden;
            }

            .btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
                transition: left 0.5s ease;
            }

            .btn:hover::before {
                left: 100%;
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
                    <h2 class="edit-user-title">
                        <i class="fas fa-user-edit"></i>
                        Edit User Details
                    </h2>
                </div>
                <a href="user-management.jsp" class="btn btn-outline-primary mb-3 w-100">
                    <i class="fas fa-arrow-left me-2"></i>Back to User Management
                </a>
                <% if (!msg.isEmpty()) { %>
                <div class="alert <%= msg.equals("User updated!") ? "alert-success" : "alert-danger" %>">
                    <%= msg %>
                </div>
                <% } %>

                <form method="post" autocomplete="off" novalidate>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" id="username" name="username" class="form-control" value="<%=user.getUsername()%>" required autofocus />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password <span class="text-muted">(leave blank to keep current)</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                            <input type="password" id="password" name="password" class="form-control" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-id-badge"></i></span>
                            <input type="text" id="name" name="name" class="form-control" value="<%=user.getName()%>" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control" value="<%=user.getEmail()%>" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            <input type="text" id="phone" name="phone" class="form-control" value="<%=user.getPhone()%>" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role <span class="text-danger">*</span></label>
                        <select id="role" name="role" class="form-select" required>
                            <option value="cashier" <%= "cashier".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>Cashier</option>
                            <option value="admin" <%= "admin".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>Admin</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="status" class="form-label">Status <span class="text-danger">*</span></label>
                        <select id="status" name="status" class="form-select" required>
                            <option value="active" <%= "active".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Active</option>
                            <option value="inactive" <%= "inactive".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Inactive</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-save me-2"></i>Update User
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
