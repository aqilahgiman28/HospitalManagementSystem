<%-- 
    Document   : home
    Created on : Mar 21, 2024, 9:13:59 AM
    Author     : nur_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="icon" href="../assets/img/hospital_icon.png" >
        <title>Medilab | HM System</title>

        <!-- Custom fonts for this template-->
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">


        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">

    </head>
    <style>
        .input-group-text{
            background-color: #2c4964;
            color:white;
            font-weight: 700;
            min-width:150px
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

                            <div class="col">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Doctor</span>
                                    </div>
                                    <select class="custom-select" id="inputGroupSelect01" id="doctor" onchange="displaySlot()">
                                        <option disabled selected value="0">Choose...</option>
                                        <option value="1">Dr. Ahmad</option>
                                        <option value="2">Dr. Raju</option>
                                        <option value="3">Dr. Adely</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Date Slot</span>
                                    </div>
                                    <input type="date" class="form-control" id="date-slot" onchange="displaySlot()" value="">
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

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../assets/js/sb-admin-2.min.js"></script>

        <script>



            function displaySlot() {


                const xhttp = new XMLHttpRequest();
                xhttp.onload = function () {
                    document.getElementById("slot-result").innerHTML =
                            this.responseText;
                }
                xhttp.open("GET", "component/slot-list.jsp");
                xhttp.send();
            }


        </script>

    </body>

</html>
