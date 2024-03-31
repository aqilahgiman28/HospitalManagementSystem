<%-- 
    Document   : slot-list
    Created on : Mar 21, 2024, 4:38:48 PM
    Author     : nur_n
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dbcon.dbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String specialize = request.getParameter("specialize").trim();
    String date = request.getParameter("date").trim();

    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String formattedDate = currentDate.format(formatter);

    dbConnect query1 = new dbConnect();
    ResultSet rs2 = null;
    String sql2 = "SELECT * FROM \"public\".slot "
            + "INNER JOIN \"public\".doctor ON \"public\".slot.doctor_id = \"public\".doctor.\"id\" ";

    if (!specialize.equals("") && !date.equals("")) {
        sql2 += "WHERE \"public\".slot.date = '" + date + "' AND \"public\".doctor.specialization = '" + specialize + "'";

    } else {
        if (!date.equals("")) {
            sql2 += "WHERE \"public\".slot.date = '" + date + "'";
        }

        if (!specialize.equals("")) {
            sql2 += "WHERE \"public\".doctor.specialization = '" + specialize + "'";
        }
    }
    sql2 += "AND  \"public\".slot.status = 'available' AND \"public\".slot.date > '"+formattedDate+"'";

    rs2 = query1.sqlquery(sql2);
    int i = 1;

%>
<div class="row row-cols-1 row-cols-md-2 ">

    <%if (rs2.next()) {
            do {%>
    <div class="col my-2" >
        <div class="card card-body ">
            <div class="row">
                <div class="col-2 text-center">
                    <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-calendar-day" style="font-size:20px"></i></span>
                </div>
                <div class="col-6">
                    <h6 class="font-weight-bolder" style="font-size:small"><span class="mr-2"><%out.println(rs2.getString("date"));%></span> | <span class="ml-2"><%out.println(rs2.getString("time"));%></span> </h6>
                    <span class="font-weight-bold mr-3"><%out.println(rs2.getString("name"));%></span><span class="font-weight-light"> Room 2</span>
                </div>
                <div class="col-4">
                    <button class="btn font-weight-bolder text-light w-100" style=" background-color: #1977cc;"
                            type="button" id="book-app-btn"
                            data-id="<%out.println(rs2.getString("id"));%>" 
                            data-doc="<%out.println(rs2.getString("name"));%>" 
                            data-date="<%out.println(rs2.getString("date"));%>" 
                            data-time="<%out.println(rs2.getString("time"));%>">Book</button>
                </div>
            </div>

        </div>

    </div>
    <% } while (rs2.next());
    } else {%>
    <div class="col my-2" >
        <div class="card card-body ">
            <div class="row">
                <div class="col-2 text-center">
                    <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-face-sad-tear" style="font-size:20px"></i></span>
                </div>
                <div class="col-10 d-grid">
                    <h6 class="font-weight-bolder">No slot available</h6>
                </div> 
            </div>

        </div>
    </div>
    <%
        }
    %>


</div>
