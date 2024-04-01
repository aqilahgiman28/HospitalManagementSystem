package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\" />\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"author\" content=\"\" />\n");
      out.write("        <title>Login - SB Admin Pro</title>\n");
      out.write("        <link href=\"https://sb-admin-pro.startbootstrap.com/css/styles.css\" rel=\"stylesheet\" />\n");
      out.write("       <link rel=\"icon\" href=\"../assets/img/hospital_icon.png\" >\n");
      out.write("        <script data-search-pseudo-elements=\"\" defer=\"\" src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color: #6eabc2;\">\n");
      out.write("        <div id=\"layoutAuthentication\">\n");
      out.write("            <div id=\"layoutAuthentication_content\">\n");
      out.write("                <main>\n");
      out.write("                    <div class=\"container-xl px-4\">\n");
      out.write("                        <div class=\"row justify-content-center\">\n");
      out.write("                            <div class=\"col-lg-5\">\n");
      out.write("                                <!-- Basic login form-->\n");
      out.write("                                <div class=\"card shadow-lg border-0 rounded-lg mt-5\">\n");
      out.write("                                    <div class=\"card-header justify-content-center\"><h3 class=\"fw-light my-4\">Admin Login</h3></div>\n");
      out.write("                                    <div class=\"card-body\">\n");
      out.write("                                        <!-- Login form-->\n");
      out.write("                                        <form action=\"../loginAdmin\" method=\"post\">\n");
      out.write("                                            <!-- Form Group (email address)-->\n");
      out.write("                                            <div class=\"mb-3\">\n");
      out.write("                                                <label class=\"small mb-1\" for=\"inputEmailAddress\">Email</label>\n");
      out.write("                                                <input class=\"form-control\" id=\"inputEmailAddress\" name=\"email\" type=\"email\" placeholder=\"Enter email address\" />\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- Form Group (password)-->\n");
      out.write("                                            <div class=\"mb-3\">\n");
      out.write("                                                <label class=\"small mb-1\" for=\"inputPassword\">Password</label>\n");
      out.write("                                                <input class=\"form-control\" id=\"inputPassword\" name=\"password\" type=\"password\" placeholder=\"Enter password\" />\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- Form Group (remember password checkbox)-->\n");
      out.write("                                            <div class=\"mb-3\">\n");
      out.write("                                                <div class=\"form-check\">\n");
      out.write("                                                    <input class=\"form-check-input\" id=\"rememberPasswordCheck\" type=\"checkbox\" value=\"\" />\n");
      out.write("                                                    <label class=\"form-check-label\" for=\"rememberPasswordCheck\">Remember password</label>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <!-- Form Group (login box)-->\n");
      out.write("                                            <div class=\"d-flex align-items-center justify-content-between mt-4 mb-0\">\n");
      out.write("                                                \n");
      out.write("                                                <button class=\"btn btn-primary\" type=\"submit\">Login</button>\n");
      out.write("                                            </div>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("<!--                                    <div class=\"card-footer text-center\">\n");
      out.write("                                        <div class=\"small\"><a href=\"auth-register-basic.html\">Need an account? Sign up!</a></div>\n");
      out.write("                                    </div>-->\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </main>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"layoutAuthentication_footer\">\n");
      out.write("                <footer class=\"footer-admin mt-auto footer-dark\">\n");
      out.write("                    <div class=\"container-xl px-4\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-6 small\">Copyright © Your Website 2021</div>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </footer>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"js/scripts.js\"></script>\n");
      out.write("    <script defer src=\"https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317\" integrity=\"sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==\" data-cf-beacon='{\"rayId\":\"86c6dabaebb33db1\",\"version\":\"2024.3.0\",\"token\":\"6e2c2575ac8f44ed824cef7899ba8463\"}' crossorigin=\"anonymous\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
