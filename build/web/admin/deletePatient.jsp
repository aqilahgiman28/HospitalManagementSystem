<%-- 
    Document   : deleteDoctor
    Created on : Mar 26, 2024, 2:37:34 AM
    Author     : USER
--%>

<!DOCTYPE html>
<%@page import="dbcon.dbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    dbConnect query1 = new dbConnect();
    int rowAffected =0;
    String a= request.getParameter("id");
    String sql = "DELETE FROM public.patient WHERE id='"+ a +"'";
    rowAffected = query1.deletedata(sql);

    if (rowAffected > 0) {
        out.println("Data Deleted");
        response.sendRedirect("/HospitalManagementSystem-main/admin/patient.jsp?status=deleted&rowAffected=" + rowAffected);

    }else{
        response.sendRedirect("/HospitalManagementSystem-main/admin/patient.jsp?status=failed");
    }


%>


