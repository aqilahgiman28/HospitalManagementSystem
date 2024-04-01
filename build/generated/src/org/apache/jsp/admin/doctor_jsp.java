package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.ResultSet;
import dbcon.dbConnect;
import admin.Admin;

public final class doctor_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem-main/admin/loginAdmin.jsp");
    } else {
        String id = (String) request.getSession().getAttribute("user_id");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("        <title>HMS Admin - Doctor List</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- Custom fonts for this template-->\r\n");
      out.write("        <link href=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("        <link\r\n");
      out.write("            href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\"\r\n");
      out.write("            rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"icon\" href=\"../assets/img/hospital_icon.png\" >\r\n");
      out.write("        <!-- Custom styles for this template-->\r\n");
      out.write("        <link href=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body id=\"page-top\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Page Wrapper -->\r\n");
      out.write("        <div id=\"wrapper\">\r\n");
      out.write("\r\n");
      out.write("            <!-- Sidebar -->\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "component/sideNavBar.jsp", out, false);
      out.write(" \r\n");
      out.write("            <!-- End of Sidebar -->\r\n");
      out.write("\r\n");
      out.write("            <!-- Content Wrapper -->\r\n");
      out.write("            <div id=\"content-wrapper\" class=\"d-flex flex-column\">\r\n");
      out.write("\r\n");
      out.write("                <!-- Main Content -->\r\n");
      out.write("                <div id=\"content\">\r\n");
      out.write("\r\n");
      out.write("                    <!-- Topbar -->\r\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "component/topNavBar.jsp", out, false);
      out.write(" \r\n");
      out.write("                    <!-- End of Topbar -->\r\n");
      out.write("                    ");

                        dbConnect connection = new dbConnect();
                        String sql = "SELECT d.*, u.*, d.id AS doc_id, u.id AS us_id "
                                + "FROM public.doctor AS d "
                                + "JOIN public.\"user\" AS u ON d.user_id = u.id "
                                + "LIMIT 1000 OFFSET 0";

                        ResultSet rs = connection.sqlquery(sql);
                        // out.println(sql);
                    
      out.write("\r\n");
      out.write("                    <!-- Begin Page Content -->\r\n");
      out.write("                    <div class=\"container-fluid\">\r\n");
      out.write("\r\n");
      out.write("                        <!-- Page Heading -->\r\n");
      out.write("\r\n");
      out.write("                        <!-- DataTales Example -->\r\n");
      out.write("                        <div class=\"card shadow mb-4\">\r\n");
      out.write("                            <div class=\"card-header py-3\">\r\n");
      out.write("                                <h6 class=\"m-0 font-weight-bold text-primary\">Doctor Lists</h6>\r\n");
      out.write("                            </div><div style=\"margin-bottom: 20px;\"></div>\r\n");
      out.write("                            <div ><button class=\"btn btn-success ml-4\" onclick=\"window.location.href = 'addDoctor.jsp'\">Add New Doctor</button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <div class=\"table-responsive\">\r\n");
      out.write("                                    <table class=\"table table-bordered\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\r\n");
      out.write("                                        <thead>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                                <th>Name</th>\r\n");
      out.write("                                                <th>Specialization</th>\r\n");
      out.write("                                                <th>Consultation Rate</th>\r\n");
      out.write("                                                <th colspan=\"2\" style=\"text-align: center;\">Action</th> \r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                        </thead>\r\n");
      out.write("\r\n");
      out.write("                                        <tbody>\r\n");
      out.write("                                            ");

                                                int i = 1;
                                                while (rs.next()) {
                                                    try {
                                            
      out.write("\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                                <td>");
 out.println(rs.getString("name")); 
      out.write("</td>\r\n");
      out.write("                                                <td>");
 out.println(rs.getString("specialization")); 
      out.write("</td>\r\n");
      out.write("                                                <td>");
 out.println(rs.getString("rate_consultation")); 
      out.write("</td>\r\n");
      out.write("                                                <td>\r\n");
      out.write("                                                    ");
 String updateredirect = "updateDoctor.jsp?id=" + rs.getString("us_id");
      out.write("\r\n");
      out.write("                                                    <a href=\"");
 out.println(updateredirect);
      out.write("\" class=\"btn btn-primary w-100\">Update</a>\r\n");
      out.write("\r\n");
      out.write("                                                </td>\r\n");
      out.write("                                                <td>\r\n");
      out.write("                                                    ");
 String deleteredirect = "deleteDoctor.jsp?id=" + rs.getString("us_id");
      out.write("\r\n");
      out.write("                                                    <a href=\"");
 out.println(deleteredirect);
      out.write("\" class=\"btn btn-danger w-100\">Delete</a>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                                </td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            ");

                                                    } catch (Exception ex) {

                                                    }
                                                    i++;
                                                }
                                            
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                        </tbody>\r\n");
      out.write("                                    </table>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- /.container-fluid -->\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- End of Main Content -->\r\n");
      out.write("\r\n");
      out.write("                <!-- Footer -->\r\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "component/footer.jsp", out, false);
      out.write(" \r\n");
      out.write("                <!-- End of Footer -->\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- End of Content Wrapper -->\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- End of Page Wrapper -->\r\n");
      out.write("\r\n");
      out.write("        <!-- Scroll to Top Button-->\r\n");
      out.write("        <a class=\"scroll-to-top rounded\" href=\"#page-top\">\r\n");
      out.write("            <i class=\"fas fa-angle-up\"></i>\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <!-- Logout Modal-->\r\n");
      out.write("        <div class=\"modal fade\" id=\"logoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\"\r\n");
      out.write("             aria-hidden=\"true\">\r\n");
      out.write("            <div class=\"modal-dialog\" role=\"document\">\r\n");
      out.write("                <div class=\"modal-content\">\r\n");
      out.write("                    <div class=\"modal-header\">\r\n");
      out.write("                        <h5 class=\"modal-title\" id=\"exampleModalLabel\">Ready to Leave?</h5>\r\n");
      out.write("                        <button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("                            <span aria-hidden=\"true\">×</span>\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"modal-body\">Select \"Logout\" below if you are ready to end your current session.</div>\r\n");
      out.write("                    <div class=\"modal-footer\">\r\n");
      out.write("                        <button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>\r\n");
      out.write("                        <a class=\"btn btn-primary\" href=\"../index.jsp\">Logout</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap core JavaScript-->\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Core plugin JavaScript-->\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Custom scripts for all pages-->\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/sb-admin-2.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Page level plugins -->\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/datatables/jquery.dataTables.min.js\"></script>\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/datatables/dataTables.bootstrap4.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Page level custom scripts -->\r\n");
      out.write("        <script src=\"https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/datatables-demo.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
 }
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
