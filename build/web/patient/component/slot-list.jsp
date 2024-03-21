<%-- 
    Document   : slot-list
    Created on : Mar 21, 2024, 4:38:48 PM
    Author     : nur_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row row-cols-1 row-cols-md-2 ">

    <% for(int i = 1; i<8;i++){ %>
    <div class="col my-2" >
        <div class="card card-body ">
            <div class="row">
                <div class="col-2 text-center">
                    <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-calendar-day" style="font-size:20px"></i></span>
                </div>
                <div class="col-6">
                    <h6 class="font-weight-bolder"><span class="mr-2">4 April 2024</span> | <span class="ml-2">2:00 PM</span> </h6>
                    <span class="font-weight-bold mr-3">Dr Ahmad</span><span class="font-weight-light"> Room 2</span>
                </div>
                <div class="col-4">
                    <button class="btn font-weight-bolder text-light w-100" style=" background-color: #1977cc;">Book</button>
                </div>
            </div>

        </div>

    </div>
        <% }%>


</div>
