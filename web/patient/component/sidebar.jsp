<%-- 
    Document   : sidebar
    Created on : Mar 21, 2024, 9:28:22 AM
    Author     : nur_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color:#1977cc">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fa-solid fa-hospital"></i>
        </div>
        <div class="sidebar-brand-text mx-3">HM System</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0" >

    <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Home</span></a>
    </li>
    
    <li class="nav-item active">
        <a class="nav-link" href="slot.jsp">
            <i class="fa-solid fa-calendar-day"></i>
            <span>Slot</span></a>
    </li>
    
    <li class="nav-item active">
        <a class="nav-link" href="my_appointment.jsp">
            <i class="fa-solid fa-calendar-check"></i>
            <span>My Appointment</span></a>
    </li>


</ul>
