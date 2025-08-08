<%-- 
    Document   : bill-report
    Created on : 16 Jul 2025, 16:22:00
    Author     : Jegamohan Srisayidan
--%> 

<%@ page import="java.util.List" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.BillDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.CustomerDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Bill" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Customer" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    com.pahana.pahanaedubookshopbilling.model.User currentUser =
        (com.pahana.pahanaedubookshopbilling.model.User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String accountNoStr = request.getParameter("accountNo");
    java.sql.Date fromDate = (from != null && !from.isEmpty()) ? java.sql.Date.valueOf(from) : null;
    java.sql.Date toDate = (to != null && !to.isEmpty()) ? java.sql.Date.valueOf(to) : null;
    Integer accountNo = (accountNoStr != null && !accountNoStr.isEmpty()) ? Integer.parseInt(accountNoStr) : null;

    BillDAO billDAO = new BillDAO();
    List<Bill> bills = billDAO.getBillsFiltered(fromDate, toDate, accountNo);

    CustomerDAO customerDAO = new CustomerDAO();

    double totalSales = 0, totalDiscount = 0, totalTax = 0, totalPaid = 0;
    for (Bill bill : bills) {
        totalSales += bill.getTotalAmount();
        totalDiscount += bill.getDiscount();
        totalTax += bill.getTax();
        totalPaid += bill.getPaidAmount();
    }
    List<Customer> customers = customerDAO.getAllCustomers();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Bill Report - Pahana Edu Bookshop Billing</title>
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
            
            /* Merged Bill Report Styles with Theme Colors */
            
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

            /* Report Title with Theme Colors */
            
            .report-title {
                font-size: 2rem;
                font-weight: 800;
                color: #273F4F;
                margin-bottom: 0.5rem;
                text-align: center;
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
                font-size: 1.05rem;
                color: var(--primary-color);
            }

            .bill-table tbody tr.totals {
                background: rgba(239, 238, 234, 0.5);
                font-weight: 700;
            }

            /* Filter Form */
            
            .filter-form label {
                font-weight: 500;
                margin-right: 1.5rem;
                color: var(--primary-color);
                display: flex;
                align-items: center;
            }

            .filter-form input,
            .filter-form select {
                margin-left: 0.5rem;
                min-width: 120px;
            }

            .filter-form button,
            .filter-form .reset-link {
                margin-left: 1rem;
            }

            /* Reset Link */
            
            .reset-link {
                color: var(--danger-color);
                font-weight: 500;
                text-decoration: underline;
            }

            .reset-link:hover {
                color: var(--danger-hover);
            }

            /* Report Navigation Links */
            
            nav.report-links {
                margin-bottom: 1.5rem;
                text-align: center;
            }

            nav.report-links a {
                color: var(--primary-color);
                font-weight: 600;
                margin: 0 0.5rem;
                text-decoration: none;
                transition: color 0.2s;
            }

            nav.report-links a:hover {
                color: var(--primary-hover);
                text-decoration: underline;
            }

            /* Print Link */
            
            .print-link {
                color: var(--primary-color) !important;
                font-weight: 700;
            }

            .print-link:hover {
                text-decoration: underline;
                color: var(--primary-hover) !important;
            }

            /* Button Colors */
            
            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
            }

            .btn-primary:hover {
                background-color: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
            }

            .btn-primary:focus {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
            }

            .btn-primary:active {
                background-color: var(--primary-hover);
                border-color: var(--primary-hover);
                color: var(--light-color);
            }

            .btn-link {
                color: var(--danger-color);
            }

            .btn-link:hover {
                color: var(--danger-hover);
            }

            .btn-link:focus {
                color: var(--danger-color);
            }

            .btn-link:active {
                color: var(--danger-hover);
            }

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
                .filter-form label {
                    display: block;
                    margin-bottom: 0.7rem;
                }
            }

            /* Print Styles */
            
            @media print {
                .navbar, .scroll-top, .logout-confirm, nav.report-links, .filter-form {
                    display: none !important;
                }
                .dashboard-card, .main-content, body {
                    background: white !important;
                    box-shadow: none !important;
                }
                .bill-table th, .bill-table td {
                    color: black !important;
                }
                .report-title {
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
                    <div class="report-title"><i class="fas fa-chart-bar me-2"></i> Bill Reports</div>
                </div>
                <nav class="report-links mb-3">
                    <a href="new-bill.jsp"><i class="fas fa-plus me-1"></i>New Bill</a>
                    <span>|</span>
                    <a href="bill-history.jsp"><i class="fas fa-file-invoice me-1"></i>Bill History</a>
                    <span>|</span>
                    <a href="customer-management.jsp"><i class="fas fa-arrow-left me-1"></i>Customers</a>
                </nav>
                <form method="get" class="filter-form d-flex flex-wrap align-items-center mb-3 gap-2">
                    <label>From:
                        <input type="date" name="from" value="<%= (from != null) ? from : "" %>" class="form-control form-control-sm">
                    </label>
                    <label>To:
                        <input type="date" name="to" value="<%= (to != null) ? to : "" %>" class="form-control form-control-sm">
                    </label>
                    <label>Customer:
                        <select name="accountNo" class="form-select form-select-sm">
                            <option value="">All</option>
                            <% for (Customer c : customers) { %>
                            <option value="<%=c.getAccountNo()%>" <%= (accountNo != null && accountNo == c.getAccountNo()) ? "selected" : "" %>>
                                <%=c.getName()%> (<%=c.getAccountNo()%>)
                            </option>
                            <% } %>
                        </select>
                    </label>
                    <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-filter me-1"></i>Filter</button>
                    <a href="bill-report.jsp" class="reset-link btn btn-link btn-sm">Reset</a>
                </form>
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
                                <th>Receipt</th>
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
                                    <a href="bill-details.jsp?billId=<%=bill.getBillId()%>" target="_blank" class="print-link">
                                        <i class="fas fa-print me-1"></i>Print
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                            <tr class="totals">
                                <td colspan="5">Totals</td>
                                <td><%= totalSales %></td>
                                <td colspan="2"></td>
                            </tr>
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
