<%-- 
    Document   : delete-user
    Created on : 16 Jul 2025, 16:29:36
    Author     : Jegamohan Srisayidan
--%>

<%@ page import="com.pahana.pahanaedubookshopbilling.dao.UserDAO" %>
<%@ page import="com.pahana.pahanaedubookshopbilling.model.User" %>

<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || !"admin".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = Integer.parseInt(request.getParameter("userId"));
    new UserDAO().deleteUser(userId);
    response.sendRedirect("user-management.jsp");
%>
