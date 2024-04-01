<%-- 
    Document   : addDoctor
    Created on : Mar 24, 2024, 12:04:02 PM
    Author     : USER
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<%@page import="admin.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem/admin/loginAdmin.jsp");
    } else {
        String id = (String) request.getSession().getAttribute("user_id");
%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin - Update Patient</title>
        <link href="https://sb-admin-pro.startbootstrap.com/css/styles.css" rel="stylesheet" />
        <link rel="icon" href="../assets/img/hospital_icon.png" >
        <script data-search-pseudo-elements="" defer="" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed" >

        <div id="layoutSidenav_content">
            <main>
                <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                    <div class="container-xl px-4">
                        <div class="page-header-content">
                            <div class="row align-items-center justify-content-between pt-3">
                                <div class="col-auto mb-3">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="user"></i></div>
                                        Admin - Update Patient
                                    </h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- Main page content-->
                <%
                    String user_id = request.getParameter("id").trim();
                    dbConnect connection = new dbConnect();
                    String sql = "SELECT p.*, u.*, p.id AS pat_id, u.id AS us_id "
                            + "FROM public.patient AS p "
                            + "JOIN public.\"user\" AS u ON p.user_id = u.id "
                            + "WHERE p.id = '" + user_id + "' "
                            + "LIMIT 1000 OFFSET 0;";

                    ResultSet rs = connection.sqlquery(sql);

                    while (rs.next()) {
                %>
                <div class="container-xl px-4 mt-4">
                    <!-- Account page navigation-->
                    <hr class="mt-0 mb-4" />
                    <div class="row justify-content-center align-items-center">
                        <div class="col-xl-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">Update Patient Details</div>
                                <div class="card-body">
                                    <form action="../updatePatient" method="post">
                                        <!-- Form Group (username)-->
                                        <div class="mb-3">
                                            <label class="small mb-1">Username</label>
                                            <input class="form-control" id="floatingInput" name="username" type="text" placeholder="description" value="<% out.println(rs.getString("username"));%>" />

                                        </div>
                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (first name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1">Email</label>
                                                <input class="form-control" id="floatingInput" name="email" type="text" placeholder="description" value="<% out.println(rs.getString("email"));%>" />

                                            </div>
                                            <!-- Form Group (last name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" >Password</label>
                                                <input class="form-control" id="floatingInput" name="password" type="text" placeholder="description" value="<% out.println(rs.getString("password"));%>" />

                                            </div>
                                        </div>
                                        <!-- Form Row        -->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (organization name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" >Name</label>
                                                <input class="form-control" id="floatingInput" name="name" type="text" placeholder="description" value="<% out.println(rs.getString("name"));%>" />
                                            </div>
                                            <!-- Form Group (location)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" >Consultation Rate</label>
                                                <input class="form-control" id="floatingInput" name="dob" type="text" placeholder="description" value="<% out.println(rs.getString("dob"));%>" />

                                            </div>
                                        </div>
                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" >rGender</label>
                                                <input class="form-control" id="floatingInput" name="gender" type="text" placeholder="description" value="<% out.println(rs.getString("gender"));%>" />

                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" >Phone number</label>
                                                <input class="form-control" id="floatingInput" name="phone" type="text" placeholder="description" value="<% out.println(rs.getString("phone_number"));%>" />
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="small mb-1">Address</label>
                                            <input class="form-control" id="floatingInput" name="address" type="text" placeholder="description" value="<% out.println(rs.getString("address"));%>" />
                                            <input name="id" type="hidden"  value="<% out.println(rs.getString("us_id"));%>" />
                                        </div>



                                        <!-- Save changes button-->
                                        <div class="text-center"> 
                                            <button class="btn btn-primary" type="submit">Update details</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>


            </main>
            <footer class="footer-admin mt-auto footer-light">
                <div class="container-xl px-4">
                    <div class="row">
                        <div class="col-md-6 small">Copyright © Your Website 2021</div>
                        <div class="col-md-6 text-md-end small">

                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script data-cfasync="false" src="https://sb-admin-pro.startbootstrap.com/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://sb-admin-pro.startbootstrap.com/js/scripts.js"></script>

    <!--        <script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
            <sb-customizer project="sb-admin-pro"></sb-customizer>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"8693c1c2ab6d3893","version":"2024.3.0","token":"6e2c2575ac8f44ed824cef7899ba8463"}' crossorigin="anonymous"></script>-->
</body>
</html>

<% }%>