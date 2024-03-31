<%-- 
    Document   : topbar
    Created on : Mar 21, 2024, 9:29:52 AM
    Author     : nur_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <h6><b>HM System</b></h6>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

 
    <%
            String email = (String) request.getSession().getAttribute("email");

        %>
        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <div class="nav-link dropdown-toggle" id="userDropdown">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%  out.println(email);%></span>
                <img class="img-profile rounded-circle" src="../assets/img/profile-pic.jpg" style="object-fit: cover">
            </div>
           
        </li>

    </ul>

</nav>
