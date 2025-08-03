<%-- 
    Document   : dashboard
    Created on : 16 Jul 2025, 15:09:52
    Author     : Jegamohan Srisayidan
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"cashier".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    // Get last login time from session or set default
    String lastLogin = (String) session.getAttribute("lastLogin");
    if (lastLogin == null) {
        lastLogin = "Today, " + java.time.LocalTime.now().format(java.time.format.DateTimeFormatter.ofPattern("h:mm a"));
        session.setAttribute("lastLogin", lastLogin);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cashier Dashboard - Pahana Edu Bookshop</title>
        <link rel="icon" type="image/png" href="images/logo.png">

        <!-- Bootstrap CSS -->
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome Icons -->
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->
        
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Custom CSS -->
        
        <link href="../styles/dashboard.css" rel="stylesheet">

        <!-- Cashier-specific styles -->
        
        <style>
            .bg-success-gradient {
                background: linear-gradient(135deg, #059669 0%, #10b981 100%);
            }

            .navbar .nav-link {
                color: var(--dark-color) !important;
                font-weight: 500;
                margin: 0 0.25rem;
                transition: all 0.3s ease;
                border-radius: 0.5rem;
                padding: 0.5rem 1rem !important;
            }

            .navbar .nav-link:hover {
                background: rgba(5, 150, 105, 0.1);
                color: var(--success-color) !important;
            }

            .card-icon.cashier-icon {
                box-shadow: 0 10px 20px -10px var(--success-color);
            }
        </style>
    </head>
    <body >
        
        <!-- Navigation -->
        
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <i class="fas fa-book-open me-2"></i>
                    Pahana Edu
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="../customer-management.jsp">
                                <i class="fas fa-user-friends me-1"></i> Customers
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../item-management.jsp">
                                <i class="fas fa-boxes me-1"></i> Book Store
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../new-bill.jsp">
                                <i class="fas fa-file-invoice me-1"></i> Billing
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../bill-history.jsp">
                                <i class="fas fa-file-invoice me-1"></i> Bills
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../bill-report.jsp">
                                <i class="fas fa-chart-bar me-1"></i> Reports
                            </a>
                        </li>
                    </ul>

                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle user-dropdown" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle me-2"></i>
                                <%= user.getName() %>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li class="dropdown-header">
                                    <div class="d-flex flex-column">
                                        <span class="fw-bold"><%= user.getName() %></span>
                                        <small class="text-muted"><%= user.getUsername() %></small>
                                    </div>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="../profile.jsp"><i class="fas fa-user me-2"></i>Profile</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
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
            
            <!-- Header Section -->
            
            <div class="dashboard-header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <h1 class="dashboard-title">
                                <i class="fas fa-cash-register me-3"></i>
                                Cashier Dashboard
                            </h1>
                            <p class="dashboard-subtitle">
                                Welcome back, <strong><%= user.getName() %></strong> 
                                <span class="badge bg-success ms-2"><%= user.getUsername() %></span>
                            </p>
                        </div>
                        <div class="col-md-4 text-end">
                            <div class="dashboard-stats">
                                <small class="text-muted">Last Login</small>
                                <div class="fw-bold"><%= lastLogin %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Cards -->
            
            <div class="container-fluid">
                <div class="row g-4">
                    
                    <!-- Customer Management Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-success cashier-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="card-content">
                                <h3>Customer Management</h3>
                                <p>View and manage customer information</p>
                                <div class="card-stats">
                                    <span class="stat-number">100</span>
                                    <span class="stat-label">Total Customers</span>
                                </div>
                            </div>
                            <a href="../customer-management.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Item Lookup Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-info cashier-icon">
                                <i class="fas fa-boxes"></i>
                            </div>
                            <div class="card-content">
                                <h3>Books Lookup</h3>
                                <p>Search and view available Books</p>
                                <div class="card-stats">
                                    <span class="stat-number">102</span>
                                    <span class="stat-label">Books in Stock</span>
                                </div>
                            </div>
                            <a href="../item-management.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Create New Bill Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card featured">
                            <div class="card-icon bg-warning cashier-icon">
                                <i class="fas fa-file-invoice"></i>
                            </div>
                            <div class="card-content">
                                <h3>Create New Bill</h3>
                                <p>Generate new billing transactions</p>
                                <div class="card-stats">
                                    <span class="stat-number">New</span>
                                    <span class="stat-label">Transaction</span>
                                </div>
                            </div>
                            <a href="../new-bill.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Bill History Card -->
                    
                    <div class="col-xl-6 col-lg-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-secondary cashier-icon">
                                <i class="fas fa-history"></i>
                            </div>
                            <div class="card-content">
                                <h3>Bill History</h3>
                                <p>View and manage past transactions</p>
                                <div class="card-stats">
                                    <span class="stat-number">200</span>
                                    <span class="stat-label">This Month</span>
                                </div>
                            </div>
                            <a href="../bill-history.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Reports Card -->
                    
                    <div class="col-xl-6 col-lg-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-danger cashier-icon">
                                <i class="fas fa-chart-bar"></i>
                            </div>
                            <div class="card-content">
                                <h3>Reports & Analytics</h3>
                                <p>View sales reports and statistics</p>
                                <div class="card-stats">
                                    <span class="stat-number">12</span>
                                    <span class="stat-label">Available Reports</span>
                                </div>
                            </div>
                            <a href="../bill-report.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions Section -->
                
                <div class="row mt-5">
                    <div class="col-12">
                        <div class="quick-actions">
                            <h4 class="mb-3">
                                <i class="fas fa-bolt me-2"></i>
                                Quick Actions
                            </h4>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <a href="../new-bill.jsp" class="btn btn-primary w-100">
                                        <i class="fas fa-plus me-2"></i>New Bill
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="../customer-management.jsp?action=add" class="btn btn-outline-primary w-100">
                                        <i class="fas fa-user-plus me-2"></i>Add Customer
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="../bill-report.jsp" class="btn btn-outline-primary w-100">
                                        <i class="fas fa-search me-2"></i>Search Bills
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="../bill-history.jsp" class="btn btn-outline-primary w-100">
                                        <i class="fas fa-download me-2"></i>Today's Report
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scroll to top button -->
        
        <div class="scroll-top">
            <i class="fas fa-arrow-up"></i>
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

        <!-- Bootstrap JS -->
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JavaScript -->
        
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                
                // Variables
                
                const dashboardCards = document.querySelectorAll('.dashboard-card');
                const scrollTopBtn = document.querySelector('.scroll-top');
                const logoutBtn = document.getElementById('logoutBtn');
                const logoutConfirm = document.querySelector('.logout-confirm');
                const cancelLogout = document.querySelector('.cancel-logout');
                const confirmLogout = document.querySelector('.confirm-logout');
                const navbar = document.querySelector('.navbar');

                // Card hover animations
                
                dashboardCards.forEach(card => {
                    card.addEventListener('mouseenter', function () {
                        this.style.transform = 'translateY(-10px)';
                    });

                    card.addEventListener('mouseleave', function () {
                        this.style.transform = 'translateY(0)';
                    });

                    card.addEventListener('click', function (e) {
                        
                        // Don't trigger if clicking on the link arrow
                        
                        if (e.target.closest('.card-link'))
                            return;

                        this.style.transform = 'translateY(-5px) scale(0.98)';
                        setTimeout(() => {
                            this.style.transform = 'translateY(-10px) scale(1)';

                            // Navigate to the card's link if it has one
                            
                            const cardLink = this.querySelector('.card-link');
                            if (cardLink) {
                                window.location.href = cardLink.getAttribute('href');
                            }
                        }, 150);
                    });
                });

                // Scroll to top functionality
                
                window.addEventListener('scroll', function () {
                    if (window.pageYOffset > 300) {
                        scrollTopBtn.classList.add('active');
                    } else {
                        scrollTopBtn.classList.remove('active');
                    }

                    // Navbar scroll effect
                    
                    if (window.pageYOffset > 50) {
                        navbar.classList.add('scrolled');
                    } else {
                        navbar.classList.remove('scrolled');
                    }
                });

                scrollTopBtn.addEventListener('click', function () {
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
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
                    
                    // Show a nice loading animation on the button
                    
                    this.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Logging out...';
                    this.disabled = true;

                    // Redirect to logout.jsp after a short delay
                    
                    setTimeout(() => {
                        window.location.href = '../logout.jsp';
                    }, 800);
                });

                // Close logout modal when clicking outside
                
                logoutConfirm.addEventListener('click', function (e) {
                    if (e.target === this) {
                        logoutConfirm.classList.remove('active');
                    }
                });

                // Escape key to close logout modal
                
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && logoutConfirm.classList.contains('active')) {
                        logoutConfirm.classList.remove('active');
                    }
                });

                // Current date-time for cashier dashboard
                
                function updateDateTime() {
                    const now = new Date();
                    const options = {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit'
                    };
                    const dateTimeDisplay = document.getElementById('currentDateTime');
                    if (dateTimeDisplay) {
                        dateTimeDisplay.textContent = now.toLocaleDateString('en-US', options);
                    }
                }

                // Update the date time initially and then every minute
                
                updateDateTime();
                setInterval(updateDateTime, 60000);

                // Initialize tooltips if you're using them
                
                if (typeof bootstrap !== 'undefined' && bootstrap.Tooltip) {
                    const tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]');
                    tooltips.forEach(tooltip => {
                        new bootstrap.Tooltip(tooltip);
                    });
                }
            });
        </script>
    </body>
</html>