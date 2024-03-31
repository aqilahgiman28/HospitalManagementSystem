<%-- 
    Document   : addDoctor
    Created on : Mar 24, 2024, 12:04:02 PM
    Author     : USER
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<%@page import="admin.Slot"%>
<!DOCTYPE html>
<% if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem-main/admin/loginAdmin.jsp");
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
        <title>Admin - Add New Slot</title>
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
                                        Admin - Add New Slot
                                    </h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- Main page content-->
                <%
                    dbConnect db = new dbConnect();
                    ResultSet rs2 = db.getdata("SELECT mr.*, a.*, p.*, s.*, d.name AS docName "
                                + "FROM public.medical_record mr "
                                + "JOIN public.appointment a ON mr.appointment_id = a.id "
                                + "JOIN public.patient p ON a.patient_id = p.id "
                                + "JOIN public.slot s ON a.slot_id = s.id "
                                + "JOIN public.doctor d ON s.doctor_id = d.id ");
                    ResultSet rs = db.getdata("SELECT id, name as medName FROM medicine");
                    StringBuilder doctorJson = new StringBuilder("[");
                    boolean first = true;
                    while (rs.next()) {
                        if (!first) {
                            doctorJson.append(",");
                        }
                        doctorJson.append("{\"id\":\"")
                                .append(rs.getString("id"))
                                .append("\",\"medName\":\"")
                                .append(rs.getString("medName"))
                                .append("\"}");
                        first = false;
                    }
                    doctorJson.append("]");
                %>


                <div class="container-xl px-4 mt-4">
                    <!-- Account page navigation-->
                    <hr class="mt-0 mb-4" />
                    <div class="row justify-content-center align-items-center">
                        <div class="col-xl-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">Add New Slot</div>
                                <div class="card-body">
                                    <form  action="../addSlot" method="post">
                                        <!-- Form Group (username)-->


                                        <div class="mb-3">
                                            <label class="small mb-1" for="doctorSelect">Doctor Name</label>
                                            <input class="form-control" id="slotDate" name="date" type="date" placeholder="description" />
                                        </div>

                                        <!-- Form Row-->

                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (first name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="floatingInput">Date</label>
                                                <input class="form-control" id="slotDate" name="date" type="date" placeholder="description" />
                                            </div>
                                            <!-- Form Group (last name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="floatingInput">Time</label>

                                                <input class="form-control" id="slotTime" name="time" type="time" />
                                            </div>

                                        </div>

                                        <!-- Form Group (email address)-->
                                        <!-- Form Group (email address)-->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="medicine">Medicine</label>
                                            <div id="medicineContainer">
                                                <select class="form-select" id="doctorSelect" name="medicine">
                                                    <% while (rs.next()) {%>
                                                    <option value="<%= rs.getString("id")%>">
                                                        <%= rs.getString("medName")%>
                                                    </option>
                                                    <% }%>
                                                </select>
                                            </div>
                                            <button class="btn btn-sm btn-secondary mt-2" type="button" onclick="addMedicine()">+</button>
                                        </div>



                                        <!-- Form Row-->

                                        <!-- Save changes button-->
                                        <div class="text-center"> 
                                            <button class="btn btn-primary" type="submit">Add Slot</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
    <script>
    var doctorOptions = <%= doctorJson %>;

    function addMedicine() {
        var container = document.getElementById("medicineContainer");

        
        // Create dropdown menu
        var select = document.createElement("select");
        select.className = "form-select mt-2";
        select.name = "medicineDropdown";

        // Populate dropdown options from doctor data
        doctorOptions.forEach(function(doctor) {
            var optionElement = document.createElement("option");
            optionElement.value = doctor.id;
            optionElement.text = doctor.name;
            select.appendChild(optionElement);
        });

        container.appendChild(select);
    }
</script>


    <script data-cfasync="false" src="https://sb-admin-pro.startbootstrap.com/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://sb-admin-pro.startbootstrap.com/js/scripts.js"></script>

    <!--        <script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
            <sb-customizer project="sb-admin-pro"></sb-customizer>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"8693c1c2ab6d3893","version":"2024.3.0","token":"6e2c2575ac8f44ed824cef7899ba8463"}' crossorigin="anonymous"></script>-->
</body>
</html>

<% }%>