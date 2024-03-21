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
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">Home</h1>
                        </div>
                        <div class="row row-cols-1 row-cols-xl-2">
                            <div class="col p-4">
                                <div class="card ">
                                    <div class="card-header">My Profile</div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-center mb-4">
                                            <img src="https://source.unsplash.com/random/?person" style="height:200px;width:200px;object-fit: cover;border-radius: 100%">
                                        </div>
                                        <hr>
                                        <div class="mt-4">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Name</span>
                                                </div>
                                                <input type="text" class="form-control" value="Nor Nazurah Binti Hassan"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Date of Birth</span>
                                                </div>
                                                <input type="text" class="form-control" value="28 August 2000" readonly>
                                            </div>   
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Gender</span>
                                                </div>
                                                <input type="text" class="form-control" value="Female"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Address</span>
                                                </div>
                                                <textarea class="form-control" aria-label="With textarea" readonly>Atas tanah bawah langit</textarea>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="card-footer"><button class="btn btn-secondary">Update Profile</button></div>
                                </div>
                            </div>
                            <div class="col p-4">
                                <h5 class="font-weight-bolder">Upcoming Appointment</h5>
                                <div class="card card-body mb-3">
                                    <div class="row">
                                        <div class="col-2 text-center">
                                            <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-calendar-check" style="font-size:30px"></i></span>
                                        </div>
                                        <div class="col-10">
                                            <div class="d-sm-flex align-items-center justify-content-between">
                                                <h6 class="font-weight-bolder"><span class="mr-2">4 April 2024</span> | <span class="ml-2">2:00 PM</span> </h6>
                                                <span class="badge badge-success">Booked</span>
                                            </div>
                                            <span class="font-weight-bold mr-4 name-span" > Dr Ahmad</span>
                                            <span class="font-weight-light"> Room 2</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-body mb-3">
                                    <div class="row mb">
                                        <div class="col-2 text-center">
                                            <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-calendar-check" style="font-size:30px"></i></span>
                                        </div>
                                        <div class="col-10">
                                            <div class="d-sm-flex align-items-center justify-content-between">
                                                <h6 class="font-weight-bolder"><span class="mr-2">2 April 2024</span> | <span class="ml-2">11:00 AM</span> </h6>
                                                <span class="badge badge-danger">Cancel</span>
                                            </div>
                                            <span class="font-weight-bold mr-4 name-span" > Dr Ahmad</span>
                                            <span class="font-weight-light"> Room </span>
                                        </div>
                                    </div>

                                </div>

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

    </body>

</html>
