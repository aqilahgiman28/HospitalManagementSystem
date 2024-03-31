<%-- 
    Document   : login
    Created on : Mar 21, 2024, 8:43:31 AM
    Author     : nur_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Medilab - Registration</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <link rel="icon" href="../assets/img/hospital_icon.png" >

        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        
    </head>
    <style>
        label{
            font-weight: 300;
        }
        span{
            font-size:medium;
            font-weight: 700;
        }
    </style>
    <body style="background-color:#1977cc">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-12">

                    <div class="card o-hidden border-0 shadow-lg my-5" style="height:100vdh;">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Registration</h1>
                                        </div>
                                        <form class="patient-form" action="../registerpatient" method="post">
                                            <p class="font-weight-bold">Personal Details</p>
                                            <div class="row mb-3">
                                                <label class="col-4">Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control col-8"
                                                       id="name" name="name" required>

                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-4">Date of Birth <span class="text-danger ">*</span></label>
                                                <input type="date" class="form-control col-8"
                                                       id="dob" name="dob" required>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-4">Gender</label>
                                                <select class="form-control custom-select col-8 " id="inputGroupSelect01" id="gender" name="gender"  required>
                                                    <option disabled selected value="0">Choose...</option>
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                </select>

                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-4">Address</label>
                                                <textarea  class="form-control  col-8" id="address"  name="address"></textarea>
                                            </div>
                                            <hr>
                                            <p class="font-weight-bold">Contact Details</p>
                                            <div class="row mb-3">
                                                <label class="col-4">Phone Number <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control col-8"
                                                       id="phone_number" name="phone_number" required>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-4">Email <span class="text-danger ">*</span></label>
                                                <input type="email" class="form-control col-8"
                                                       id="email"  name="email" required>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-4">Password <span class="text-danger ">*</span></label>
                                                <input type="password" class="form-control col-8"
                                                       id="password" name="password" required>
                                            </div>
                                            <div id="password-strength-status"></div>
                                            <div class="row mb-3">
                                                <label class="col-4">Confirm Password <span class="text-danger ">*</span></label>
                                                <input type="password" class="form-control col-8"
                                                       id="confirm-password"  name="confirm-password" required>
                                            </div>
                                             <div id="password-confirm-status"></div>
                                            <!--<input type="hidden" id="role" name="role" value="patient">-->


                                            <button class="btn btn-primary btn-user btn-block" id="register-btn">
                                                Register
                                            </button>
                                        </form>

                                    </div>
                                </div>
                                <div class="col-lg-6 d-none d-lg-block"> <img src="https://source.unsplash.com/random/?patient" style="height:100%;width: 100%;object-fit: cover"></div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#password').on('input', function () {
                    var number = /([0-9])/;
                    var alphabets = /([a-zA-Z])/;
                    var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
                    var password = $(this).val().trim();
                    if (password.length < 6) {
                        $('#password-strength-status').removeClass();
                        $('#password-strength-status').addClass('alert alert-danger');
                        $('#password-strength-status').html("Weak (should be atleast 6 characters.)");
                        $('#register-btn').prop('disabled', true);
                    } else {
                        if (password.match(number) && password.match(alphabets) && password.match(special_characters)) {
                            $('#password-strength-status').removeClass();
                            $('#password-strength-status').addClass('alert alert-success');
                            $('#password-strength-status').html("Strong");
                            $('#register-btn').prop('disabled', false);

                        } else {
                            $('#password-strength-status').removeClass();
                            $('#password-strength-status').addClass('alert alert-warning');
                            $('#password-strength-status').html("Medium (should include alphabets, numbers and special characters.)");
                            $('#register-btn').prop('disabled', true);

                        }
                    }
                })
            })
            $("#confirm-password").on('input', function () {
                var password = $("#password").val();
                var confirmPassword = $("#confirm-password").val();
                if (password != confirmPassword) {
                    $('#password-confirm-status').removeClass();
                    $('#password-confirm-status').addClass('alert alert-danger');
                    $('#password-confirm-status').html("Password does not match !");
                    $('#register-btn').prop('disabled', true);

                } else {

                    $('#password-confirm-status').removeClass();
                    $('#password-confirm-status').addClass('alert alert-success');
                    $('#password-confirm-status').html("Password match !");
                    $('#register-btn').prop('disabled', false);

                }
            });
        </script>


    </body>


</html>
