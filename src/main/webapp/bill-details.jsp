<%-- 
    Document   : bill-details
    Created on : 16 Jul 2025, 15:32:54
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="com.pahana.pahanaedubookshopbilling.dao.BillDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.BillItemDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.CustomerDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.dao.ItemDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Bill" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.BillItem" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Customer" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.Item" %>

<%
    String billIdStr = request.getParameter("billId");
    if (billIdStr == null) {
        response.sendRedirect("bill-history.jsp");
        return;
    }
    int billId = Integer.parseInt(billIdStr);
    BillDAO billDAO = new BillDAO();
    BillItemDAO billItemDAO = new BillItemDAO();
    CustomerDAO customerDAO = new CustomerDAO();
    ItemDAO itemDAO = new ItemDAO();

    Bill bill = billDAO.getBillById(billId);
    if (bill == null) {
        response.sendRedirect("bill-history.jsp");
        return;
    }
    Customer customer = customerDAO.getCustomerByAccountNo(bill.getAccountNo());
    java.util.List<BillItem> items = billItemDAO.getBillItemsByBillId(billId);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Bill #<%=bill.getBillId()%></title>
        <link rel="icon" type="image/png" href="images/logo.png">
        <link rel="stylesheet" href="styles/bill-details.css"> <!-- Link to external CSS -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="printable">
            <header class="bill-header">
                <h2 class="bill-title">Pahana Edu Bookshop - Bill #<%=bill.getBillId()%></h2>

            </header>
            <div class="bill-date">Date: <%=bill.getBillDate()%></div>

            <section class="bill-info">

                <div>
                    <strong>Customer name and ID :</strong>
                    <p><%= (customer != null) ? customer.getName() : "N/A" %> (<%= bill.getAccountNo() %>)</p>
                </div>
                <div>
                    <strong>Cashier/Login User ID :</strong>
                    <p><%=bill.getUserId()%></p>
                </div>
            </section>


            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Discount</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            int i = 1; 
                            for (BillItem bi : items) { 
                                Item item = itemDAO.getItemById(bi.getItemId());
                        %>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%= bi.getItemId() %></td>
                            <td><%= (item != null) ? item.getName() : "N/A" %></td>
                            <td><%= bi.getItemPrice() %></td>
                            <td><%= bi.getQuantity() %></td>
                            <td><%= bi.getDiscount() %></td>
                            <td><%= bi.getSubtotal() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="6" style="text-align:right;">Total:</th>
                            <th><%=bill.getTotalAmount()%></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <hr> <hr/>
            <div class="noprint">
                <button onclick="window.print();">Print</button>
                <a href="bill-report.jsp">Back</a>
            </div>
        </div>
    </body>
</html>
