<%-- 
    Document   : home
    Created on : Mar 21, 2024, 9:13:59 AM
    Author     : nur_n
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem/login.jsp");
    } else {%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="icon" href="../assets/img/hospital_icon.png" >
        <title>Medilab | HM System</title>

        <script src="https://cdn.lordicon.com/lordicon.js"></script>
        <!-- Custom fonts for this template-->
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">


        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>


    </head>
    <style>
        .input-group-text{
            background-color: #2c4964;
            color:white;
            font-weight: 700;
        }
        .icon-modify{
            background-color: #2c4964;
            padding:15px;
        }
        .name-span{
            color:#2c4964;
        }
    </style>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="component/sidebar.jsp" /> 
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <jsp:include page="component/topbar.jsp" /> 
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">Doctor Slots Availability</h1>
                        </div>
                        <div class="row">
                            <%
                                dbConnect query1 = new dbConnect();
                                ResultSet rs = null;
                                String sql = "SELECT distinct (specialization) FROM \"public\".\"doctor\"";
                                rs = query1.sqlquery(sql);

                            %>
                            <div class="col">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Specialize</span>
                                    </div>
                                    <select class="custom-select "  id="specialize" onchange="displaySlot()">
                                        <option disabled selected >Choose...</option>
                                        <option value="">All Specialize</option>
                                        <%while (rs.next()) {%>
                                        <option value="<%out.println(rs.getString("specialization"));%>"><%out.println(rs.getString("specialization"));%></option>
                                        <%}%>

                                    </select>
                                </div> 
                            </div>
                            <div class="col">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Date Slot</span>
                                    </div>
                                    <input type="date" class="form-control" id="date-slot" onchange="displaySlot()">
                                </div> 
                            </div>



                        </div>
                        <div class="card card-body" id="slot-result" style="min-height:400px">
                            <div  class="text-center my-5">
                                <i class="fa-solid fa-user-doctor mb-3" style="font-size:70px"></i>
                                <h5 class="font-weight-light">Please Select Doctor & Date to see available slots</h5>
                            </div>

                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->
        <form action="../bookappointment" method="post" >
            <div class="modal fade" id="book-comfirmation-modal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
                            <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <lord-icon src="https://cdn.lordicon.com/axteoudt.json" trigger="loop" delay="2000" style="width:100px;height:100px">
                                </lord-icon>
                            </div>
                            <p class="font-weight-light">Please confirm appointment details bellow</p>
                            <table class="table">
                                <thead  >
                                    <tr>
                                        <th scope="col">Date</th>
                                        <th scope="col"><span class="font-weight-bold" id="date-span"></span></th>
                                    </tr>
                                    <tr>
                                        <th scope="col">Time:</th>
                                        <th scope="col"><span class="font-weight-bold"  id="time-span"></span></th>
                                    </tr>
                                    <tr>
                                        <th scope="col">Doctor</th>
                                        <th scope="col"><span class="font-weight-bold" id="doc-span"></span></th>
                                    </tr>
                                </thead>
                            </table>
                            <input type="hidden" name="slot_id" id="slot_id">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary  btn-close" data-dismiss="modal" >Close</button>
                            <button type="submit" class="btn btn-primary">Book</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="../assets/js/sb-admin-2.min.js"></script>

        <script>
                                        function displaySlot() {
                                            console.log(document.getElementById("doctor"));
                                            var specialize = document.getElementById("specialize").value;
                                            var dateSlot = document.getElementById("date-slot").value;
                                            const xhttp = new XMLHttpRequest();
                                            xhttp.onload = function () {
                                                document.getElementById("slot-result").innerHTML =
                                                        this.responseText;
                                            }
                                            xhttp.open("GET", "component/slot-list.jsp?specialize=" + specialize + "&date=" + dateSlot);
                                            xhttp.send();
                                        }
                                        $(document).ready(function () {
                                            $(document).on('click', '#book-app-btn', function () {
                                                var doc_name = $(this).data('doc');
                                                var date_book = $(this).data('date');
                                                var time_book = $(this).data('time');
                                                var slot_id = $(this).data('id');

                                                $("#book-comfirmation-modal").find('#slot_id').val(slot_id);
                                                $("#book-comfirmation-modal").find('#date-span').html(date_book);
                                                $("#book-comfirmation-modal").find('#doc-span').html(doc_name);
                                                $("#book-comfirmation-modal").find('#time-span').html(time_book);

                                                $("#book-comfirmation-modal").modal("show");
                                            })

                                            $(document).on('click', '.btn-close', function () {
                                                $(".modal").modal("hide");
                                            })
                                        })

        </script>

    </body>

</html>

<%    }
%>
