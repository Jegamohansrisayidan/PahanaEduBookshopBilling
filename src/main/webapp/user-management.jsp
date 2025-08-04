<%-- 
    Document   : user-management
    Created on : 16 Jul 2025, 16:28:35
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.UserDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>

<%
    // Only admin can access
    
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || !"admin".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<User> users = new UserDAO().getAllUsers();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>User Management - Pahana Edu Bookshop</title>
        <link rel="icon" type="image/png" href="images/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Font Awesome -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Themed CSS -->

        <link href="styles/dashboard.css" rel="stylesheet" />
        <style>

            /* Button Styles for User Management */

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
                --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
                --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }

            /* Primary Button */

            .btn-primary {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-sm);
                display: inline-flex;
                align-items: center;
                text-decoration: none;
            }

            .btn-primary:hover {
                background: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
                transform: translateY(-1px);
                box-shadow: var(--shadow-md);
            }

            .btn-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            .btn-primary:active {
                transform: translateY(0);
            }

            /* Outline Primary Button */

            .btn-outline-primary {
                color: var(--primary-color);
                border-color: var(--primary-color);
                background: transparent;
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                border-width: 1px;
                display: inline-flex;
                align-items: center;
                text-decoration: none;
            }

            .btn-outline-primary:hover {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                transform: translateY(-1px);
                box-shadow: var(--shadow-md);
            }

            .btn-outline-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            /* Small Button Variant */

            .btn-sm {
                padding: 0.375rem 0.75rem;
                font-size: 0.875rem;
                border-radius: 0.375rem;
                min-width: 2.5rem;
                height: 2.5rem;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            /* Primary Small Button */

            .btn-sm.btn-primary {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
            }

            .btn-sm.btn-primary:hover {
                background: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
                transform: translateY(-1px);
                box-shadow: 0 2px 4px rgba(39, 63, 79, 0.3);
            }

            /* Danger Small Button */

            .btn-sm.btn-danger {
                background: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
            }

            .btn-sm.btn-danger:hover {
                background: var(--danger-hover);
                border-color: var(--danger-hover);
                color: white;
                transform: translateY(-1px);
                box-shadow: 0 2px 4px rgba(220, 38, 38, 0.3);
            }

            /* Danger Button */

            .btn-danger {
                background: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-sm);
                display: inline-flex;
                align-items: center;
                text-decoration: none;
            }

            .btn-danger:hover {
                background: var(--danger-hover);
                border-color: var(--danger-hover);
                color: white;
                transform: translateY(-1px);
                box-shadow: var(--shadow-md);
            }

            .btn-danger:focus {
                box-shadow: 0 0 0 0.2rem rgba(220, 38, 38, 0.25);
            }

            /* Secondary Button */

            .btn-secondary {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                box-shadow: var(--shadow-sm);
                display: inline-flex;
                align-items: center;
                text-decoration: none;
            }

            .btn-secondary:hover {
                background: var(--secondary-hover);
                border-color: var(--secondary-hover);
                color: white;
                transform: translateY(-1px);
                box-shadow: var(--shadow-md);
            }

            /* Outline Secondary Button */

            .btn-outline-secondary {
                color: var(--secondary-color);
                border-color: var(--secondary-color);
                background: transparent;
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                border-width: 1px;
                display: inline-flex;
                align-items: center;
                text-decoration: none;
            }

            .btn-outline-secondary:hover {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
                transform: translateY(-1px);
                box-shadow: var(--shadow-md);
            }

            /* Button Group Styles */

            .btn-group {
                display: flex;
                gap: 0.5rem;
            }

            .btn-group .btn {
                margin: 0;
            }

            /* Action Button Spacing */

            .btn + .btn {
                margin-left: 0.5rem;
            }

            /* Table Action Buttons */

            td .btn {
                margin: 0 0.125rem;
            }

            /* Icon Only Buttons */

            .btn i {
                transition: transform 0.2s ease;
            }

            .btn:hover i {
                transform: scale(1.1);
            }

            /* Loading State */

            .btn.btn-loading {
                pointer-events: none;
                opacity: 0.7;
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
                box-shadow: none !important;
            }

            /* Table Specific Button Styles */

            .table td .btn {
                white-space: nowrap;
                font-size: 0.875rem;
            }

            .table td .btn i {
                font-size: 0.875rem;
            }

            /* Responsive Button Styles */

            @media (max-width: 768px) {
                .btn {
                    padding: 0.4rem 0.8rem;
                    font-size: 0.875rem;
                }

                .btn-sm {
                    padding: 0.3rem 0.6rem;
                    font-size: 0.8rem;
                    min-width: 2rem;
                    height: 2rem;
                }

                .btn-group {
                    flex-wrap: wrap;
                    gap: 0.3rem;
                }

                .btn + .btn {
                    margin-left: 0;
                }
            }

            /* Action Button Container */

            .action-buttons {
                display: flex;
                gap: 0.25rem;
                align-items: center;
                flex-wrap: nowrap;
            }

            /* Confirmation Dialog Button Styles */

            .logout-dialog .btn-group {
                display: flex;
                gap: 0.75rem;
                justify-content: flex-end;
            }

            .logout-dialog .btn {
                flex: 1;
                min-width: 100px;
            }

            .confirm-logout {
                background: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
            }

            .confirm-logout:hover {
                background: var(--danger-hover);
                border-color: var(--danger-hover);
            }

            .cancel-logout {
                background: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
            }

            .cancel-logout:hover {
                background: var(--secondary-hover);
                border-color: var(--secondary-hover);
            }

            /* Focus visible for accessibility */

            .btn:focus-visible {
                outline: 2px solid var(--primary-color);
                outline-offset: 2px;
            }
        </style>
    </head>
    <body>
        
        <!-- Navigation Bar (copy from dashboard.jsp) -->
        
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
                        <li class="nav-item"><a class="nav-link active" href="user-management.jsp"><i class="fas fa-users me-1"></i> Users</a></li>
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
        <div class="main-content">
            <div class="container-fluid">
                <div class="dashboard-header mb-4">
                    <h1 class="dashboard-title">
                        <i class="fas fa-users me-3"></i>
                        User Management
                    </h1>
                    <p class="dashboard-subtitle">
                        Manage system users, their roles, and access permissions.
                    </p>
                </div>
                <div class="dashboard-card">
                    <div class="mb-3 d-flex flex-wrap gap-2">
                        <a href="add-user.jsp" class="btn btn-primary"><i class="fas fa-plus me-2"></i>Add User</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered align-middle mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>UserID</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Phone</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (User user : users) { %>
                                <tr>
                                    <td><%= user.getUserId() %></td>
                                    <td><%= user.getUsername() %></td>
                                    <td><%= user.getName() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getRole() %></td>
                                    <td><%= user.getStatus() %></td>
                                    <td><%= user.getPhone() %></td>
                                    <td>
                                        <a href="edit-user.jsp?userId=<%= user.getUserId() %>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></a>
                                        <a href="delete-user.jsp?userId=<%= user.getUserId() %>" class="btn btn-sm btn-danger ms-1" onclick="return confirm('Delete this user?');"><i class="fas fa-trash"></i></a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
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
        
        <!-- Custom JS: You can copy the logout/scroll JS from dashboard.jsp -->
        
        <script>
                                            // Paste your dashboard's JS for navbar, logout modal, scroll-to-top, etc. here!
                                            // (You can literally copy the script block from dashboard.jsp)
                                            
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
