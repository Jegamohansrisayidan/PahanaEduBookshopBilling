<%-- 
    Document   : dashboard
    Created on : 16 Jul 2025, 15:09:46
    Author     : Jegamohan Srisayidan
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>

<% 
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
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
        <title>Admin Dashboard - Pahana Edu Bookshop</title>
        <link rel="icon" type="image/png" href="images/logo.png">

        <!-- Bootstrap CSS -->
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome Icons -->
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->
        
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Custom CSS -->
        
        <link href="../styles/dashboard.css" rel="stylesheet">
    </head>
    <body>
        
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
                            <a class="nav-link" href="../user-management.jsp">
                                <i class="fas fa-users me-1"></i> Users
                            </a>
                        </li>
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
            
            <!-- Header Section -->
            
            <div class="dashboard-header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <h1 class="dashboard-title">
                                <i class="fas fa-tachometer-alt me-3"></i>
                                Admin Dashboard
                            </h1>
                            <p class="dashboard-subtitle">
                                Welcome back, <strong><%= user.getName() %></strong> 
                                <span class="badge bg-primary ms-2"><%= user.getUsername() %></span>
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
                    
                    <!-- User Management Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-primary">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="card-content">
                                <h3>User Management</h3>
                                <p>Manage system users and their permissions</p>
                                <div class="card-stats">
                                    <span class="stat-number">2</span>
                                    <span class="stat-label">Active Users</span>
                                </div>
                            </div>
                            <a href="../user-management.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Customer Management Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-success">
                                <i class="fas fa-user-friends"></i>
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

                    <!-- Item Management Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-info">
                                <i class="fas fa-boxes"></i>
                            </div>
                            <div class="card-content">
                                <h3>Books Management</h3>
                                <p>Manage Books and product catalog</p>
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
                            <div class="card-icon bg-warning">
                                <i class="fas fa-plus-circle"></i>
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

                    <!-- Bill Management Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-secondary">
                                <i class="fas fa-file-invoice"></i>
                            </div>
                            <div class="card-content">
                                <h3>Bill Management</h3>
                                <p>View and manage billing history</p>
                                <div class="card-stats">
                                    <span class="stat-number">89</span>
                                    <span class="stat-label">This Month</span>
                                </div>
                            </div>
                            <a href="../bill-history.jsp" class="card-link">
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Reports Card -->
                    
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <div class="dashboard-card">
                            <div class="card-icon bg-danger">
                                <i class="fas fa-chart-bar"></i>
                            </div>
                            <div class="card-content">
                                <h3>Reports & Analytics</h3>
                                <p>View comprehensive business reports</p>
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
                                    <a href="../item-management.jsp" class="btn btn-outline-primary w-100">
                                        <i class="fas fa-plus me-2"></i>Add Books
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="../customer-management.jsp" class="btn btn-outline-primary w-100">
                                        <i class="fas fa-user-plus me-2"></i>Add Customer
                                    </a>
                                </div>
                                <div class="col-md-3">
                                    <a href="../bill-report.jsp" class="btn btn-outline-primary w-100">
                                        <i class="fas fa-download me-2"></i>Export Report
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- System Status Section -->
                
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="system-status">
                            <div class="row g-4">
                                <div class="col-md-4">
                                    <div class="status-card">
                                        <div class="status-icon">
                                            <i class="fas fa-server"></i>
                                        </div>
                                        <div class="status-info">
                                            <h5>System Status</h5>
                                            <div class="status-indicator online">
                                                <i class="fas fa-circle"></i>
                                                <span>Online</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="status-card">
                                        <div class="status-icon">
                                            <i class="fas fa-database"></i>
                                        </div>
                                        <div class="status-info">
                                            <h5>Database</h5>
                                            <div class="status-indicator online">
                                                <i class="fas fa-circle"></i>
                                                <span>Connected</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="status-card">
                                        <div class="status-icon">
                                            <i class="fas fa-clock"></i>
                                        </div>
                                        <div class="status-info">
                                            <h5>Last Backup</h5>
                                            <div class="status-text">
                                                <span>Today, 12:00 PM</span>
                                            </div>
                                        </div>
                                    </div>
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

                // Admin-specific functionality
                
                function checkSystemStatus() {
                    
                    // Simulating status checks - in a real app, this would call backend APIs
                    
                    console.log('System status checked');
                    
                    // You could update status indicators based on real data here
                }

                // Check status every 60 seconds
                
                checkSystemStatus();
                setInterval(checkSystemStatus, 60000);
            });
        </script>
    </body>
</html>