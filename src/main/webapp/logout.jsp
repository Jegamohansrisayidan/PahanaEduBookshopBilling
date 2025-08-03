<%-- 
    Document   : logout
    Created on : 16 Jul 2025, 15:12:13
    Author     : Jegamohan Srisayidan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Invalidate the session to log the user out
    
    session.invalidate();
    
    // Redirect back to login page
    
    response.sendRedirect("login.jsp");
%>
