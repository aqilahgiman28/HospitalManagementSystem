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

        .nav-link{
            margin:0px 20px 10px 0px;
        }
        .name-span{
            color:#2c4964;
        }
        .list-app{
            min-width:900px;
            margin:0px 10px
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
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">My Appointment</h1>
                        </div>
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link btn btn-secondary active rounded-pill px-5" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-all" aria-selected="true">All</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link btn btn-secondary rounded-pill px-5" id="pills-upcoming-tab" data-bs-toggle="pill" data-bs-target="#pills-upcoming" type="button" role="tab" aria-controls="pills-upcoming" aria-selected="false">Upcoming</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link btn btn-secondary rounded-pill px-5" id="pills-past-tab" data-bs-toggle="pill" data-bs-target="#pills-past" type="button" role="tab" aria-controls="pills-past" aria-selected="false">Past</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent" style="overflow-x: auto">
                            <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">

                                <div class="row mb-3 list-app" >
                                    <div class="card card-body text-light py-2 font-weight-bolder" style="background-color:#1977cc" >
                                        <div class="row align-items-center">
                                            <div class="col-1 align-middle">#</div>
                                            <div class="col-3">Date Time</div>
                                            <div class="col-2">Doctor</div>
                                            <div class="col-2">Room</div>
                                            <div class="col-2">Status</div>
                                            <div class="col-2 ">Action</div>

                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-1">1</div>
                                            <div class="col-3">23 March 2024 | 2.00PM</div>
                                            <div class="col-2">Dr Raju</div>
                                            <div class="col-2">Room 1</div>
                                            <div class="col-2"><span class="badge badge-success">Booked</span></div>
                                            <div class="col-2 "><button class="btn btn-danger w-100">Cancel</button></div>

                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-1">2</div>
                                            <div class="col-3">23 March 2024 | 2.00PM</div>
                                            <div class="col-2">Dr Raju</div>
                                            <div class="col-2">Room 1</div>
                                            <div class="col-2"><span class="badge badge-danger">Cancel</span></div>
                                            <div class="col-2 "><button class="btn btn-danger w-100" disabled>Cancel</button></div>

                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="tab-pane fade" id="pills-upcoming" role="tabpanel" aria-labelledby="pills-upcoming-tab">...2</div>
                            <div class="tab-pane fade" id="pills-past" role="tabpanel" aria-labelledby="pills-past-tab">...3</div>
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

    </body>

</html>
