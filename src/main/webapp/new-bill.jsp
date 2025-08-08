<%-- 
    Document   : new-bill
    Created on : 16 Jul 2025, 15:31:32
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Customer" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.CustomerDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Item" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.ItemDAO" %>

<%
    com.pahana.pahanaedubookshopbilling.model.User currentUser =
        (com.pahana.pahanaedubookshopbilling.model.User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Customer> customers = new CustomerDAO().getAllCustomers();
    List<Item> items = new ItemDAO().getAllItems();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Create New Bill - Pahana Edu Bookshop Billing</title>
        <link rel="icon" type="image/png" href="images/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Font Awesome -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Dashboard CSS -->

        <link href="styles/dashboard.css" rel="stylesheet" />

        <style>
            .bill-title {
                font-size: 2.2rem;
                font-weight: 800;
                background: linear-gradient(90deg,#1e40af,#2563eb,#f59e0b,#dc2626);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                text-fill-color: transparent;
                text-shadow: 0 2px 8px rgba(37,99,235,0.08);
                margin-bottom: 0.4rem;
                display: flex;
                align-items: center;
                gap: 0.7rem;
                justify-content: center;
            }
            .hidden {
                display: none !important;
            }
            input[readonly] {
                background-color: #e9ecef;
                cursor: not-allowed;
            }
            .table th, .table td {
                vertical-align: middle !important;
            }

            /* Add Item Button Color */

            .btn-primary {
                background-color: #273F4F;
                border-color: #273F4F;
                color: #EFEEEA;
            }

            .btn-primary:hover {
                background-color: #1a2b36;
                border-color: #1a2b36;
                color: #EFEEEA;
            }

            .btn-primary:focus {
                background-color: #273F4F;
                border-color: #273F4F;
                color: #EFEEEA;
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            .btn-primary:active {
                background-color: #1a2b36;
                border-color: #1a2b36;
                color: #EFEEEA;
            }

            /* Bill Title Color */

            .bill-title {
                font-size: 2.2rem;
                font-weight: 800;
                background: linear-gradient(90deg, #273F4F, #1a2b36, #273F4F);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                text-fill-color: transparent;
                text-shadow: 0 2px 8px rgba(39, 63, 79, 0.08);
                margin-bottom: 0.4rem;
                display: flex;
                align-items: center;
                gap: 0.7rem;
                justify-content: center;
            }

            /* Alternative solid color version */

            .bill-title-solid {
                color: #273F4F;
                font-size: 2.2rem;
                font-weight: 800;
                margin-bottom: 0.4rem;
                display: flex;
                align-items: center;
                gap: 0.7rem;
                justify-content: center;
            }

            /* Icon color for the title */

            .bill-title i {
                color: #273F4F;
            }

            /* Add New Customer Button Color */

            .btn-outline-primary {
                color: #273F4F;
                border-color: #273F4F;
                background-color: transparent;
            }

            .btn-outline-primary:hover {
                background-color: #273F4F;
                border-color: #273F4F;
                color: #EFEEEA;
            }

            .btn-outline-primary:focus {
                background-color: #273F4F;
                border-color: #273F4F;
                color: #EFEEEA;
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            .btn-outline-primary:active {
                background-color: #1a2b36;
                border-color: #1a2b36;
                color: #EFEEEA;
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
            <div class="dashboard-card" style="max-width: 950px; width:100%;">
                <div class="mb-4 text-center">
                    <h2 class="bill-title"><i class="fas fa-file-invoice-dollar"></i> Create New Bill</h2>

                </div>
                <form method="post" action="billing" autocomplete="off" onsubmit="return validateBillForm();">
                    <div class="mb-3">
                        <label for="accountNoSelect" class="form-label"><i class="fas fa-user me-2"></i>Customer <span class="text-danger">*</span></label>
                        <select name="accountNo" id="accountNoSelect" class="form-select" required>
                            <option value="" disabled selected>-- Select Customer --</option>
                            <% for (Customer c : customers) { %>
                            <option value="<%=c.getAccountNo()%>"><%=c.getName()%> (<%=c.getAccountNo()%>)</option>
                            <% } %>
                        </select>
                        <a href="add-customer.jsp" class="btn btn-outline-primary mt-3 d-block text-center">
                            <i class="fas fa-receipt me-2""></i>Add New Customer
                        </a>
                    </div>

                    <div class="table-responsive mb-3">
                        <table class="table table-bordered align-middle">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Item</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Discount</th>
                                    <th>Subtotal</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="itemTableBody">

                                <!-- First visible row -->

                                <tr>
                                    <td>
                                        <select name="itemId" class="form-select" required onchange="updatePrice(this)">
                                            <option value="">-- Select Item --</option>
                                            <% for (Item i : items) { %>
                                            <option value="<%=i.getItemId()%>" data-price="<%=i.getPrice()%>"><%=i.getName()%></option>
                                            <% } %>
                                        </select>
                                    </td>
                                    <td><input type="number" name="itemPrice" class="form-control" readonly value="0" step="0.01" min="0" required></td>
                                    <td><input type="number" name="quantity" class="form-control" value="1" min="1" onchange="updateSubtotal(this)" required></td>
                                    <td><input type="number" name="discount" class="form-control" value="0" min="0" onchange="updateSubtotal(this)" required></td>
                                    <td><input type="number" name="subtotal" class="form-control" readonly value="0" step="0.01" min="0" required></td>
                                    <td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)"><i class="fas fa-trash"></i></button></td>
                                </tr>

                                <!-- Hidden template row -->

                                <tr id="itemRowTemplate" class="hidden">
                                    <td>
                                        <select name="itemId" class="form-select" onchange="updatePrice(this)">
                                            <option value="">-- Select Item --</option>
                                            <% for (Item i : items) { %>
                                            <option value="<%=i.getItemId()%>" data-price="<%=i.getPrice()%>"><%=i.getName()%></option>
                                            <% } %>
                                        </select>
                                    </td>
                                    <td><input type="number" name="itemPrice" class="form-control" readonly value="0" step="0.01" min="0"></td>
                                    <td><input type="number" name="quantity" class="form-control" value="1" min="1" onchange="updateSubtotal(this)"></td>
                                    <td><input type="number" name="discount" class="form-control" value="0" min="0" onchange="updateSubtotal(this)"></td>
                                    <td><input type="number" name="subtotal" class="form-control" readonly value="0" step="0.01" min="0"></td>
                                    <td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)"><i class="fas fa-trash"></i></button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button type="button" class="btn btn-primary mb-3" onclick="addItemRow()"><i class="fas fa-plus me-2"></i>Add Item</button>
                    <div class="row g-3 mb-3">
                        <div class="col-md-3">
                            <label for="totalAmountInput" class="form-label"><i class="fas fa-calculator me-2"></i>Total Amount</label>
                            <input type="number" id="totalAmountInput" name="totalAmount" class="form-control" step="0.01" readonly value="0" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="paymentMethodSelect" class="form-label"><i class="fas fa-money-check-alt me-2"></i>Payment Method</label>
                        <select name="paymentMethod" id="paymentMethodSelect" class="form-select">
                            <option value="cash">Cash</option>
                            <option value="card">Card</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success w-100"><i class="fas fa-receipt me-2"></i>Generate Bill</button>
                </form>

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

        <!-- Bootstrap JS and custom script -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                        function addItemRow() {
                            const template = document.getElementById('itemRowTemplate');
                            const table = document.getElementById('itemTableBody');
                            const newRow = template.cloneNode(true);
                            newRow.style.display = '';
                            newRow.removeAttribute('id');
                            newRow.classList.remove('hidden');
                            newRow.querySelectorAll('select').forEach(sel => sel.selectedIndex = 0);
                            newRow.querySelectorAll('input').forEach(inp => {
                                if (inp.name === "itemPrice" || inp.name === "discount" || inp.name === "subtotal") {
                                    inp.value = "0";
                                } else if (inp.name === "quantity") {
                                    inp.value = "1";
                                }
                            });
                            table.appendChild(newRow);
                        }

                        function removeRow(btn) {
                            const row = btn.closest('tr');
                            if (row) {
                                row.remove();
                                updateTotal();
                            }
                        }

                        function updatePrice(select) {
                            const price = select.options[select.selectedIndex].getAttribute('data-price') || "0";
                            const row = select.closest('tr');
                            if (row) {
                                row.querySelector('[name="itemPrice"]').value = price;
                                updateSubtotal(row);
                            }
                        }

                        function updateSubtotal(rowOrInput) {
                            const row = rowOrInput.closest ? rowOrInput.closest('tr') : rowOrInput;
                            const price = parseFloat(row.querySelector('[name="itemPrice"]').value) || 0;
                            const qty = parseInt(row.querySelector('[name="quantity"]').value) || 1;
                            const discount = parseFloat(row.querySelector('[name="discount"]').value) || 0;
                            const subtotal = (price * qty) - discount;
                            row.querySelector('[name="subtotal"]').value = subtotal.toFixed(2);
                            updateTotal();
                        }

                        function updateTotal() {
                            let total = 0;
                            document.querySelectorAll('#itemTableBody tr:not(.hidden)').forEach(row => {
                                const subtotalInput = row.querySelector('[name="subtotal"]');
                                if (subtotalInput) {
                                    total += parseFloat(subtotalInput.value) || 0;
                                }
                            });
                            const totalAmountInput = document.getElementById('totalAmountInput');
                            if (totalAmountInput) {
                                totalAmountInput.value = total.toFixed(2);
                            }
                        }

                        function validateBillForm() {
                            const rows = document.querySelectorAll('#itemTableBody tr:not(.hidden)');
                            if (rows.length === 0) {
                                alert("Please add at least one item.");
                                return false;
                            }
                            for (let i = 0; i < rows.length; i++) {
                                const itemSelect = rows[i].querySelector('select[name="itemId"]');
                                const quantityInput = rows[i].querySelector('input[name="quantity"]');
                                if (!itemSelect.value) {
                                    alert("Please select an item in all rows.");
                                    return false;
                                }
                                if (!quantityInput.value || Number(quantityInput.value) < 1) {
                                    alert("Quantity must be at least 1 in all rows.");
                                    return false;
                                }
                            }
                            if (!document.getElementById('accountNoSelect').value) {
                                alert("Please select a customer.");
                                return false;
                            }
                            return true;
                        }

                        // Theme JS for navbar/scroll-top/logout

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
