<%-- 
    Document   : profile
    Created on : 25 Jul 2025, 14:07:35
    Author     : Jegamohan Srisayidan
--%>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>User Profile - Pahana Edu Bookshop Billing</title>
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
    </head>
    <body>

        <!-- Navbar -->
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
                                <li><a class="dropdown-item text-danger" href="logout.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
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
                    <h2 class="edit-user-title">
                        <i class="fas fa-user-circle"></i>
                        Your Profile
                    </h2>
                </div>

                <ul class="list-group list-group-flush mb-4">
                    <li class="list-group-item"><strong>Name:</strong> <%= currentUser.getName() %></li>
                    <li class="list-group-item"><strong>Username:</strong> <%= currentUser.getUsername() %></li>
                    <li class="list-group-item"><strong>Email:</strong> <%= currentUser.getEmail() %></li>
                    <li class="list-group-item"><strong>Phone:</strong> <%= currentUser.getPhone() %></li>
                    <li class="list-group-item"><strong>Role:</strong> <%= currentUser.getRole().toUpperCase() %></li>
                    <li class="list-group-item"><strong>Status:</strong> <span class="badge bg-<%= "active".equalsIgnoreCase(currentUser.getStatus()) ? "success" : "secondary" %>"><%= currentUser.getStatus() %></span></li>
                </ul>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
