<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link rel="icon" href="assets/img/hospital_icon.png" >

        <title>Medilab | Website</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!-- Favicons -->

        <jsp:include page="component/style-link.jsp" /> 
    </head>

    <body>

        <!-- ======= Top Bar ======= -->
        <div id="topbar" class="d-flex align-items-center fixed-top">
            <div class="container d-flex justify-content-between">
                <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">customerService@medilab.com</a>
                    <i class="bi bi-phone"></i> +603 80342819
                </div>
                <div class="d-none d-lg-flex social-links align-items-center">
                    <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
                </div>
            </div>
        </div>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center">

                <h1 class="logo me-auto"><a href="index.html">Medilab</a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                        <li><a class="nav-link scrollto" href="#about">About</a></li>
                        <li><a class="nav-link scrollto" href="#doctors">Doctors</a></li>
                        <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
                        <li class="dropdown"><a href="#"><span>Login</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="admin/loginAdmin.jsp">Admin</a></li>
                                <li><a href="admin/loginDoctor.jsp">Doctor</a></li>
                                <li><a href="login.jsp">Patient</a></li>
                            </ul>
                        </li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

                <a href="login.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">Make an</span> Appointment</a>

            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">
            <div class="container">
                <h1>Welcome to Medilab</h1>
            </div>
        </section><!-- End Hero -->

        <main id="main">

            <!-- ======= Why Us Section ======= -->
            <section id="why-us" class="why-us">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-4 d-flex align-items-stretch">
                            <div class="content">
                                <h3>Why Choose Medilab?</h3>
                                <p>

                                    Choosing Medilab Hospital offers a combination of cutting-edge medical technology, experienced healthcare professionals, and a patient-centered approach. 
                                    With state-of-the-art facilities, Medilab ensures accurate diagnoses and effective treatments for various medical conditions. Moreover, their commitment to compassionate care fosters a supportive environment where patients feel valued and empowered throughout their healthcare journey.
                                </p>
                                <div class="text-center">
                                    <a href="#" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 d-flex align-items-stretch">
                            <div class="icon-boxes d-flex flex-column justify-content-center">
                                <div class="row">
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-receipt"></i>
                                            <h4>ENT</h4>
                                            <p>Otolaryngology, more commonly known as Ear, Nose & Throat (ENT) is the field of medicine focused on the head and neck, the ear, nose and the throat.</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-cube-alt"></i>
                                            <h4>Cardiology</h4>
                                            <p>equipped with Interventional and Non-interventional Cardiology services.</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-images"></i>
                                            <h4>Gastroenterology </h4>
                                            <p>The study of Gastroenterology is a branch of medicine that focuses on the diagnosis, treatment and prevention of diseases and disorders related to the human digestive system.</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End .content-->
                        </div>
                    </div>

                </div>
            </section><!-- End Why Us Section -->

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-xl-5 col-lg-6 d-flex justify-content-center align-items-stretch position-relative">
                            <img src="https://source.unsplash.com/random/?hospital" style="height:100%;width: 100%;object-fit: cover">
                        </div>

                        <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
                            <h3>Medilab</h3>
                            <p>Launched in 2024, Medilab – Puchong</p>

                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-fingerprint"></i></div>
                                <h4 class="title"><a href="">Details</a></h4>
                                <p class="description">Located at Lebuh Puteri, Bandar Puteri in Puchong, we are open from Mondays through Fridays from 8 am to 5 pm and from 8 am to 12 pm on Saturdays. Visiting hours at our inpatient wards are from 9 am to 9.30 pm.</p>
                            </div>

                            <div class="icon-box">
                                <div class="icon"><i class="bx bx-gift"></i></div>
                                <h4 class="title"><a href="">Services</a></h4>
                                <p class="description">Our facilities are comprehensive so you can rest assured that we have all that you need for your treatments and procedures. Modern equipment ensures that we are up to date with medical technology and updates. To find out what we have to offer, please see the list below.</p>
                            </div>

                        </div>
                    </div>

                </div>
            </section><!-- End About Section -->

            <!-- ======= Counts Section ======= -->
            <section id="counts" class="counts">
                <div class="container">

                    <div class="row">

                        <div class="col-12">
                            <div class="count-box">
                                <%                                        dbConnect query1 = new dbConnect();
                                    ResultSet rs = null;
                                    String sql = "SELECT count(*) AS COUNTDOC FROM \"public\".\"doctor\" ";
                                    rs = query1.sqlquery(sql);
                                    rs.next();

                                %>
                                <i class="fas fa-user-md"></i>
                                <span data-purecounter-start="0" data-purecounter-end="<%out.println(rs.getString("COUNTDOC"));%>" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Doctors</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Counts Section -->


            <!-- ======= Appointment Section ======= -->
            <section id="appointment" class="appointment section-bg">
                <div class="container text-center">

                    <div class="section-title">
                        <h2>Make an Appointment</h2>
                        <p> 
                            At Medilab, we are determined to provide our patients with excellence in healthcare services.
                            Book an appointment with us.</p>
                    </div>

                    <button type="submit" class="btn rounded-pill text-light fw-semibold" style="background-color:#2c4964">Make an Appointment</button>

                </div>
            </section><!-- End Appointment Section -->

            <!-- ======= Doctors Section ======= -->
            <section id="doctors" class="doctors">
                <div class="container">

                    <div class="section-title">
                        <h2>Top Doctors</h2>
                        <p>Come and meet with our professional and experience doctors!</p>
                    </div>

                    <div class="row">
                        <%
                            ResultSet rs2 = null;
                            String sql2 = "SELECT * FROM \"public\".\"doctor\" ";
                            rs2 = query1.sqlquery(sql2);

                            while (rs2.next()) {
                        %>
                        <div class="col-lg-6">
                            <div class="member d-flex align-items-start">
                                <div class="pic"><img src="assets/img/doctors/doctors-1.jpg" class="img-fluid" alt=""></div>
                                <div class="member-info">
                                    <h4><%out.println(rs2.getString("name"));%></h4>
                                    <span><%out.println(rs2.getString("specialization"));%></span>
                                    <div class="social">
                                        <a href=""><i class="ri-twitter-fill"></i></a>
                                        <a href=""><i class="ri-facebook-fill"></i></a>
                                        <a href=""><i class="ri-instagram-fill"></i></a>
                                        <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>

                    </div>

                </div>
            </section><!-- End Doctors Section -->


            <!-- ======= Gallery Section ======= -->
            <section id="gallery" class="gallery">
                <div class="container">

                    <div class="section-title">
                        <h2>Gallery</h2>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="row g-0">

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-1.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-2.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-3.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-4.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-5.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-6.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-7.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-8.jpg" class="galelry-lightbox">
                                    <img src="assets/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Gallery Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <h2>Contact</h2>
                    </div>
                </div>

                <div>
                    <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.262829630313!2d101.61961577310035!3d3.0239366539134873!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cdb4a5f0a39495%3A0x10ab6467ddb6cb03!2sColumbia%20Asia%20Hospital%20-%20Puchong!5e0!3m2!1sen!2smy!4v1711977850799!5m2!1sen!2smy" frameborder="0" allowfullscreen></iframe>
                </div>

                <div class="container">
                    <div class="row mt-5">

                        <div class="col-lg-4">
                            <div class="info">
                                <div class="address">
                                    <i class="bi bi-geo-alt"></i>
                                    <h4>Location:</h4>
                                    <p>Lebuh Puteri, Bandar Puteri, 47100 Puchong, Selangor</p>
                                </div>

                                <div class="email">
                                    <i class="bi bi-envelope"></i>
                                    <h4>Email:</h4>
                                    <p>customerService@medilab.com</p>
                                </div>

                                <div class="phone">
                                    <i class="bi bi-phone"></i>
                                    <h4>Call:</h4>
                                    <p>+603 80342819</p>
                                </div>

                            </div>

                        </div>

<!--                        <div class="col-lg-8 mt-5 mt-lg-0">

                            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                                    </div>
                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                                </div>
                                <div class="form-group mt-3">
                                    <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                </div>
                                <div class="text-center"><button type="submit">Send Message</button></div>
                            </form>

                        </div>-->

                    </div>

                </div>
            </section><!-- End Contact Section -->

        </main><!-- End #main -->



        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
            <jsp:include page="component/js-link.jsp" /> 
    </body>

</html>