<%-- 
    Document   : add-item
    Created on : 16 Jul 2025, 15:29:22
    Author     : Jegamohan Srisayidan
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    com.pahana.pahanaedubookshopbilling.model.User currentUser =
        (com.pahana.pahanaedubookshopbilling.model.User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Add New Item - Pahana Edu Bookshop Billing</title>
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
            
            /* Button Styles for Add Item Page */
            
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

            /* Primary Button - Add Item */
            
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
                position: relative;
                overflow: hidden;
            }

            .btn-primary::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(239, 238, 234, 0.2), transparent);
                transition: left 0.5s ease;
            }

            .btn-primary:hover::before {
                left: 100%;
            }

            .btn-primary:hover {
                background: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(39, 63, 79, 0.4);
            }

            .btn-primary:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
                outline: none;
            }

            .btn-primary:active {
                transform: translateY(0);
                box-shadow: var(--shadow-md);
            }

            /* Outline Primary Button - Back to List */
            
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
                position: relative;
                overflow: hidden;
            }

            .btn-outline-primary::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(39, 63, 79, 0.1), transparent);
                transition: left 0.5s ease;
            }

            .btn-outline-primary:hover::before {
                left: 100%;
            }

            .btn-outline-primary:hover {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(39, 63, 79, 0.4);
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
                box-shadow: 0 8px 20px rgba(107, 114, 128, 0.4);
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
                box-shadow: 0 8px 20px rgba(107, 114, 128, 0.4);
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
                box-shadow: 0 8px 20px rgba(220, 38, 38, 0.4);
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

            /* Block Button */
            
            .btn.d-block {
                display: block !important;
                width: 100%;
                text-align: center;
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
                min-width: 120px;
                margin: 0;
            }

            /* Add Item Title */
            
            .add-item-title {
                font-size: 1.75rem;
                font-weight: 700;
                color: var(--primary-color);
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.75rem;
            }

            .add-item-title i {
                font-size: 1.5rem;
                color: var(--primary-color);
            }

            /* Button Spacing */
            
            .btn + .btn {
                margin-top: 0.75rem;
            }

            .mt-3.btn {
                margin-top: 1rem !important;
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
            }

            .btn:hover i {
                transform: scale(1.1);
            }

            .btn i.me-2 {
                margin-right: 0.5rem !important;
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
                box-shadow: 0 12px 24px rgba(39, 63, 79, 0.4);
            }

            /* Focus States for Accessibility */
            
            .btn:focus-visible {
                outline: 2px solid var(--primary-color);
                outline-offset: 2px;
            }

            /* Form Submit Button Enhancement */
            
            form .btn-primary {
                position: relative;
                overflow: hidden;
            }

            form .btn-primary::after {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 0;
                height: 0;
                background: rgba(239, 238, 234, 0.3);
                border-radius: 50%;
                transform: translate(-50%, -50%);
                transition: width 0.3s ease, height 0.3s ease;
            }

            form .btn-primary:active::after {
                width: 300px;
                height: 300px;
            }

            /* Button Hover Effects Enhancement */
            
            .btn {
                position: relative;
                overflow: hidden;
            }

            .btn::after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(45deg, transparent 40%, rgba(255,255,255,0.1) 50%, transparent 60%);
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .btn:hover::after {
                opacity: 1;
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

            /* Form Select Styles */
            
            .form-select {
                border: 1px solid var(--primary-color);
                border-radius: 0.5rem;
                padding: 0.75rem;
                font-size: 1rem;
                transition: all 0.3s ease;
            }

            .form-select:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            /* Input Group Text Styles */
            
            .input-group-text {
                background: var(--primary-color);
                color: var(--light-color);
                border: 1px solid var(--primary-color);
                border-radius: 0.5rem 0 0 0.5rem;
            }

            .form-control {
                border: 1px solid var(--primary-color);
                border-radius: 0 0.5rem 0.5rem 0;
                padding: 0.75rem;
                font-size: 1rem;
                transition: all 0.3s ease;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
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

                .add-item-title {
                    font-size: 1.5rem;
                }

                .add-item-title i {
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

                .add-item-title {
                    font-size: 1.4rem;
                    gap: 0.5rem;
                }
            }

            /* Add Item Button Special Animation */
            
            .btn-primary[type="submit"] {
                position: relative;
                overflow: hidden;
            }

            .btn-primary[type="submit"]::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(239, 238, 234, 0.3), transparent);
                transition: left 0.6s ease;
            }

            .btn-primary[type="submit"]:hover::before {
                left: 100%;
            }

            .btn-primary[type="submit"]:active {
                transform: scale(0.98);
            }

            /* Success Animation */
            
            .btn-success-animation {
                animation: successPulse 0.6s ease-in-out;
            }

            @keyframes successPulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.05);
                    background-color: var(--success-color);
                }
                100% {
                    transform: scale(1);
                }
            }

            /* Button Click Feedback */
            
            .btn:active {
                animation: buttonClick 0.15s ease-in-out;
            }

            @keyframes buttonClick {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(0.95);
                }
                100% {
                    transform: scale(1);
                }
            }
        </style>
    </head>
    <body>
        
        <!-- Navigation Bar -->
        
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
                        <li class="nav-item"><a class="nav-link" href="customer-management.jsp"><i class="fas fa-user-friends me-1"></i> Customers</a></li>
                        <li class="nav-item"><a class="nav-link active" href="item-management.jsp"><i class="fas fa-boxes me-1"></i> Book Store</a></li>
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
            <div class="dashboard-card" style="max-width: 500px; width:100%;">
                <div class="mb-4 text-center">
                    <h2 class="add-item-title">
                        <i class="fas fa-box-open"></i>
                        Add Item
                    </h2>
                </div>
                <form method="post" action="item" novalidate>
                    <input type="hidden" name="itemId" value="" />
                    <div class="mb-3">
                        <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-book"></i></span>
                            <input type="text" id="name" name="name" class="form-control" required autofocus />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-align-left"></i></span>
                            <input type="text" id="description" name="description" class="form-control" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-money-bill"></i></span>
                            <input type="number" step="0.01" min="0" id="price" name="price" class="form-control" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="stock" class="form-label">Stock</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                            <input type="number" min="0" id="stock" name="stock" class="form-control" value="0" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-list-alt"></i></span>
                            <input type="text" id="category" name="category" class="form-control" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="author" class="form-label">Author</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user-edit"></i></span>
                            <input type="text" id="author" name="author" class="form-control" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="publisher" class="form-label">Publisher</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-building"></i></span>
                            <input type="text" id="publisher" name="publisher" class="form-control" />
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="status" class="form-label">Status</label>
                        <select id="status" name="status" class="form-select">
                            <option value="active" selected>Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-plus me-2"></i>Add Item
                    </button>
                </form>
                <a href="item?action=list" class="btn btn-outline-primary mt-3 d-block text-center">
                    <i class="fas fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
        
        <!-- Logout Confirmation Modal -->
        
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
