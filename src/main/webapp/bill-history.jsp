<%-- 
    Document   : bill-history
    Created on : 16 Jul 2025, 15:32:36
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.BillDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.CustomerDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Bill" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Customer" %>

<%
    com.pahana.pahanaedubookshopbilling.model.User currentUser =
        (com.pahana.pahanaedubookshopbilling.model.User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Bill> bills = new BillDAO().getAllBills();
    CustomerDAO customerDAO = new CustomerDAO();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Bill History - Pahana Edu Bookshop Billing</title>
        <link rel="icon" type="image/png" href="images/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Bootstrap -->
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        
        <!-- Font Awesome -->
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <!-- Google Fonts -->
        
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        
        <!-- Main Theme CSS -->
        
        <link href="styles/dashboard.css" rel="stylesheet" />
        
        <style>
            
            /* Merged Bill History Styles with Theme Colors */
            
            :root {
                --primary-color: #273F4F;
                --primary-hover: #1a2b36;
                --light-color: #EFEEEA;
                --danger-color: #dc2626;
                --danger-hover: #b91c1c;
                --secondary-color: #6b7280;
                --secondary-hover: #4b5563;
                --success-color: #059669;
            }

            /* History Title with Theme Colors */
            
            .history-title {
                font-size: 2rem;
                font-weight: 800;
                background: linear-gradient(90deg, #273F4F, #1a2b36, #273F4F, #059669);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                text-fill-color: transparent;
                text-align: center;
                margin-bottom: 0.5rem;
            }

            /* Dashboard Card */
            
            .dashboard-card {
                padding: 2.2rem 2.4rem;
            }

            /* Bill Table */
            .bill-table th, .bill-table td {
                vertical-align: middle !important;
                text-align: center;
                font-size: 1rem;
            }

            .bill-table th {
                background: var(--light-color);
                font-weight: 700;
                color: var(--primary-color);
            }

            .bill-table tbody tr.totals {
                background: rgba(239, 238, 234, 0.5);
                font-weight: 700;
            }

            /* Navigation Links */
            
            nav.history-links {
                margin-bottom: 1.5rem;
                text-align: center;
            }

            nav.history-links a {
                color: var(--primary-color);
                font-weight: 600;
                margin: 0 0.5rem;
                text-decoration: none;
                transition: color 0.2s;
            }

            nav.history-links a:hover {
                color: var(--primary-hover);
                text-decoration: underline;
            }

            /* View Link */
            
            .view-link {
                color: var(--primary-color) !important;
                font-weight: 700;
            }

            .view-link:hover {
                color: var(--primary-hover) !important;
                text-decoration: underline;
            }

            /* Button Colors */
            
            .btn-danger {
                background-color: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
            }

            .btn-danger:hover {
                background-color: var(--danger-hover);
                border-color: var(--danger-hover);
                color: white;
            }

            .btn-danger:focus {
                background-color: var(--danger-color);
                border-color: var(--danger-color);
                color: white;
            }

            .btn-danger:active {
                background-color: var(--danger-hover);
                border-color: var(--danger-hover);
                color: white;
            }

            .btn-outline-secondary {
                color: var(--secondary-color);
                border-color: var(--secondary-color);
                background-color: transparent;
            }

            .btn-outline-secondary:hover {
                background-color: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
            }

            .btn-outline-secondary:focus {
                background-color: var(--secondary-color);
                border-color: var(--secondary-color);
                color: white;
            }

            .btn-outline-secondary:active {
                background-color: var(--secondary-hover);
                border-color: var(--secondary-hover);
                color: white;
            }

            /* Badge Colors */
            
            .badge.bg-success {
                background-color: var(--success-color) !important;
            }

            .badge.bg-danger {
                background-color: var(--danger-color) !important;
            }

            /* Scroll to Top Button */
            
            .scroll-top {
                background-color: var(--primary-color);
                color: var(--light-color);
            }

            .scroll-top:hover {
                background-color: var(--primary-hover);
                color: var(--light-color);
            }

            /* Responsive Design */
            
            @media (max-width: 700px) {
                .dashboard-card {
                    padding: 1.2rem 0.5rem;
                }
            }

            /* Print Styles */
            
            @media print {
                .navbar, .scroll-top, .logout-confirm, nav.history-links {
                    display: none !important;
                }
                .dashboard-card, .main-content, body {
                    background: white !important;
                    box-shadow: none !important;
                }
                .bill-table th, .bill-table td {
                    color: black !important;
                }
                .history-title {
                    color: black !important;
                    background: none !important;
                    -webkit-text-fill-color: initial;
                }
            }
        </style>
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
        <div class="main-content d-flex justify-content-center" style="min-height:80vh;">
            <div class="dashboard-card" style="width:100%;max-width:1100px;">
                <div class="mb-4">
                    <div class="history-title"><i class="fas fa-file-invoice me-2"></i> Bill History</div>
                </div>
                <nav class="history-links mb-3">
                    <a href="new-bill.jsp"><i class="fas fa-plus me-1"></i>New Bill</a>
                    <span>|</span>
                    <a href="bill-report.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a>
                    <span>|</span>
                    <a href="item-management.jsp"><i class="fas fa-arrow-left me-1"></i>Book Store</a>
                </nav>
                <div class="table-responsive">
                    <table class="table table-bordered bill-table align-middle">
                        <thead>
                            <tr>
                                <th>Bill ID</th>
                                <th>Account</th>
                                <th>Customer Name</th>
                                <th>User</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Bill bill : bills) { 
                                   Customer customer = customerDAO.getCustomerByAccountNo(bill.getAccountNo());
                            %>
                            <tr>
                                <td><%= bill.getBillId() %></td>
                                <td><%= bill.getAccountNo() %></td>
                                <td><%= (customer != null) ? customer.getName() : "N/A" %></td>
                                <td><%= bill.getUserId() %></td>
                                <td><%= bill.getBillDate() %></td>
                                <td><%= bill.getTotalAmount() %></td>
                                <td>
                                    <span class="badge <%= "paid".equalsIgnoreCase(bill.getStatus()) ? "bg-success" : "bg-danger" %>">
                                        <%= bill.getStatus() %>
                                    </span>
                                </td>
                                <td>
                                    <a href="bill-details.jsp?billId=<%=bill.getBillId()%>" class="view-link">
                                        <i class="fas fa-eye me-1"></i>View
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
                        
        <!-- Logout Modal -->
        
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
        
        <!-- Scroll to top -->
        
        <div class="scroll-top"><i class="fas fa-arrow-up"></i></div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            
            // Scroll to top, navbar scroll, and logout modal
            
            document.addEventListener('DOMContentLoaded', function () {
                const scrollTopBtn = document.querySelector('.scroll-top');
                const logoutBtn = document.getElementById('logoutBtn');
                const logoutConfirm = document.querySelector('.logout-confirm');
                const cancelLogout = document.querySelector('.cancel-logout');
                const confirmLogout = document.querySelector('.confirm-logout');
                const navbar = document.querySelector('.navbar');
                window.addEventListener('scroll', function () {
                    if (window.pageYOffset > 300)
                        scrollTopBtn.classList.add('active');
                    else
                        scrollTopBtn.classList.remove('active');
                    if (window.pageYOffset > 50)
                        navbar.classList.add('scrolled');
                    else
                        navbar.classList.remove('scrolled');
                });
                scrollTopBtn.addEventListener('click', function () {
                    window.scrollTo({top: 0, behavior: 'smooth'});
                });
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
                    if (e.target === this)
                        logoutConfirm.classList.remove('active');
                });
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && logoutConfirm.classList.contains('active'))
                        logoutConfirm.classList.remove('active');
                });
            });
        </script>
    </body>
</html>
