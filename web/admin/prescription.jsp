<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<%@page import="admin.Prescription"%>
<!DOCTYPE html><% if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem/admin/loginAdmin.jsp");
    } else {
        String id = (String) request.getSession().getAttribute("user_id");
%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>HMS Admin - Prescription List</title>

        <!-- Custom fonts for this template-->
        <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="icon" href="../assets/img/hospital_icon.png" >
        <!-- Custom styles for this template-->
        <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="component/sideNavBar.jsp" /> 
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <jsp:include page="component/topNavBar.jsp" /> 
                    <!-- End of Topbar -->
                    <%
                        dbConnect connection = new dbConnect();
                        String sql = "SELECT pr.*,mr.*, a.*, p.*, s.*,m.*, m.name AS medName,pr.id AS presID "
                                + "FROM public.prescription pr "
                                + "JOIN public.medicine m ON pr.medicine_id = m.id "
                                + "JOIN public.appointment a ON pr.appointment_id = a.id "
                                + "JOIN public.medical_record mr ON mr.appointment_id = a.id "
                                + "JOIN public.patient p ON a.patient_id = p.id "
                                + "JOIN public.slot s ON a.slot_id = s.id "
                                + "JOIN public.doctor d ON s.doctor_id = d.id "
                                + "LIMIT 1000 OFFSET 0; ";

                        ResultSet rs = connection.sqlquery(sql);
                    %> 

                    <!-- Begin Page Content -->
                    <div class="container-fluid">


                        <!-- Page Heading -->

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Prescription Lists</h6>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Patient Name</th>
                                                <th>Description</th>
                                                <th>Prescription</th>
                                                <th>Quantity</th>
                                                <th colspan="2" style="text-align: center;">Action</th> 
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                int i = 1;
                                                while (rs.next()) {
                                                    try {
                                            %>
                                        <a href="prescription.jsp"></a>
                                        <tr>
                                            <td><% out.println(rs.getString("name")); %></td>
                                            <td><% out.println(rs.getString("status")); %></td>
                                            <td><% out.println(rs.getString("medName")); %></td>
                                            <td><% out.println(rs.getString("quantity")); %></td>
                                            <td>
                                                <% String updateredirect = "updatePrescription.jsp?id=" + rs.getString("presID");%>
                                                <a href="<% out.println(updateredirect);%>" class="btn btn-primary w-100">Update</a>

                                            </td>
                                            <td>
                                                <% String deleteredirect = "deletePrescription.jsp?id=" + rs.getString("presID");%>
                                                <a href="<% out.println(deleteredirect);%>" class="btn btn-danger w-100">Delete</a>


                                            </td>

                                        </tr>
                                        <%
                                                } catch (Exception ex) {

                                                }
                                                i++;
                                            }
                                        %>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <jsp:include page="component/footer.jsp" /> 
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">�</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="../index.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>

    <!-- Page level plugins -->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-area-demo.js"></script>
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-pie-demo.js"></script>

    <script data-cfasync="false" src="https://sb-admin-pro.startbootstrap.com/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://sb-admin-pro.startbootstrap.com/js/scripts.js"></script>

</body>

</html>
<% }%>