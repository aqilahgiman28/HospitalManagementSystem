<%-- 
    Document   : deleteMedicalRecord
    Created on : Mar 30, 2024, 12:23:33 PM
    Author     : USER
--%>

<%@page import="dbcon.dbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    dbConnect query1 = new dbConnect();
    int rowAffected =0;
    String a= request.getParameter("id").trim();
    String sql = "DELETE FROM public.medical_record WHERE id='"+ a +"'";
    rowAffected = query1.deletedata(sql);

    if (rowAffected > 0) {
        out.println("Data Deleted");
        response.sendRedirect("/HospitalManagementSystem/admin/medicalRecord.jsp?status=deleted&rowAffected=" + rowAffected);

    }else{
        response.sendRedirect("/HospitalManagementSystem/admin/medicalRecord.jsp?status=failed");
    }


%>
