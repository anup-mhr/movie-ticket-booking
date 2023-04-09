<%-- 
    Document   : index
    Created on : Apr 2, 2023, 2:05:11 PM
    Author     : Anup
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - Admin</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="Admin/assets/img/favicon.png" rel="icon">
        <link href="Admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="Admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="Admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="Admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="Admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="Admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="Admin/assets/css/style.css" rel="stylesheet">

    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="index.html" class="logo d-flex align-items-center">
                    <img src="assets/img/logo.png" alt="">
                    <span class="d-none d-lg-block">AM Movies</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div><!-- End Logo -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link nav-icon search-bar-toggle " href="#">
                            <i class="bi bi-search"></i>
                        </a>
                    </li><!-- End Search Icon-->

                    <li class="nav-item dropdown">

                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-bell"></i>
                            <span class="badge bg-primary badge-number">4</span>
                        </a><!-- End Notification Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                            <li class="dropdown-header">
                                You have 4 new notifications
                                <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-exclamation-circle text-warning"></i>
                                <div>
                                    <h4>Lorem Ipsum</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>30 min. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-x-circle text-danger"></i>
                                <div>
                                    <h4>Atque rerum nesciunt</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>1 hr. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-check-circle text-success"></i>
                                <div>
                                    <h4>Sit rerum fuga</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>2 hrs. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-info-circle text-primary"></i>
                                <div>
                                    <h4>Dicta reprehenderit</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>4 hrs. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li class="dropdown-footer">
                                <a href="#">Show all notifications</a>
                            </li>

                        </ul><!-- End Notification Dropdown Items -->

                    </li><!-- End Notification Nav -->


                    <li class="nav-item dropdown pe-3">

                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                            <img src="Admin/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
                            <span class="d-none d-md-block dropdown-toggle ps-2">${username}</span>
                        </a><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6>${username}</h6>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="AdminController?page=userProfile">
                                    <i class="bi bi-person"></i>
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="AdminController?page=userProfile">
                                    <i class="bi bi-gear"></i>
                                    <span>Account Settings</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <i class="bi bi-question-circle"></i>
                                    <span>Need Help?</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="AdminController?page=signout">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->

                </ul>
            </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link " href="AdminController?page=dashboard">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </a>
                </li><!-- End Dashboard Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-menu-button-wide"></i><span>Movies</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="AdminController?page=movies-add">
                                <i class="bi bi-circle"></i><span>Add Movie</span>
                            </a>
                        </li>
                        <li>
                            <a href="AdminController?page=movies-edit">
                                <i class="bi bi-circle"></i><span>Edit Movie</span>
                            </a>
                        </li>
                        <li>
                            <a href="AdminController?page=movies-remove">
                                <i class="bi bi-circle"></i><span>Remove Movie</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Movie Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-journal-text"></i><span>Showtime</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="AdminController?page=showtime-add">
                                <i class="bi bi-circle"></i><span>Add Showtime</span>
                            </a>
                        </li>
                        <li>
                            <a href="AdminController?page=showtime-remove">
                                <i class="bi bi-circle"></i><span>Remove Showtime</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Showtime Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-layout-text-window-reverse"></i><span>Transactions</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <c:forEach items="${movies}" var="movie">
                            <li>
                                <a href="AdminController?page=transactions-movie&movie_id=${movie.movie_id}">
                                    <i class="bi bi-circle"></i><span>${movie.title}</span>    <!--  Update with database  -->
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li><!-- End Transactions Nav -->


                <li class="nav-heading">Pages</li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="AdminController?page=UserProfile">
                        <i class="bi bi-person"></i>
                        <span>Profile</span>
                    </a>
                </li><!-- End Profile Page Nav -->

            </ul>

        </aside><!-- End Sidebar-->

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Dashboard</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section dashboard">
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-8">
                        <div class="row">

                            <!-- Sales Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card sales-card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Filter</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Today</a></li>
                                            <li><a class="dropdown-item" href="#">This Month</a></li>
                                            <li><a class="dropdown-item" href="#">This Year</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Sales <span>| Today</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-cart"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>145</h6>
                                                <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Sales Card -->

                            <!-- Revenue Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card revenue-card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Filter</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Today</a></li>
                                            <li><a class="dropdown-item" href="#">This Month</a></li>
                                            <li><a class="dropdown-item" href="#">This Year</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Revenue <span>| This Month</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-currency-dollar"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>Rs.3,264</h6>
                                                <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Revenue Card -->

                            <!-- Customers Card -->
                            <div class="col-xxl-4 col-xl-12">

                                <div class="card info-card customers-card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Filter</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Today</a></li>
                                            <li><a class="dropdown-item" href="#">This Month</a></li>
                                            <li><a class="dropdown-item" href="#">This Year</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Customers <span>| This Year</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-people"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>1244</h6>
                                                <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div><!-- End Customers Card -->

                            <!-- Now Showing -->
                            <div class="col-12">
                                <div class="card recent-sales overflow-auto">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Filter</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Today</a></li>
                                            <li><a class="dropdown-item" href="#">Tomorrow</a></li>
                                            <li><a class="dropdown-item" href="#">Next Day</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Now Showing <span>| Today</span></h5>

                                        <table class="table table-borderless datatable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Movie</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${moviesReleased}" var="movie">
                                                    <tr>
                                                        <th scope="row"><a href="#">${movie.movie_id}</a></th>
                                                        <th scope="row"><a href="#"><img src="Images/${movie.picture}" alt="" style="max-width: 60px;"></a></th>
                                                        <td><a href="#" class="text-primary fw-bold">${movie.title}</a></td>
                                                        <td>Rs. 150</td>
                                                        <td><span class="badge bg-success">Showing</span></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>

                                        </div>

                                    </div>
                                </div><!-- End Recent Sales -->

                                <!-- Top Selling -->
                                <div class="col-12">
                                    <div class="card top-selling overflow-auto">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body pb-0">
                                            <h5 class="card-title">Top Selling <span>| Today</span></h5>

                                            <table class="table table-borderless">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Preview</th>
                                                        <th scope="col">Movie</th>
                                                        <th scope="col">Sold</th>
                                                        <th scope="col">Revenue</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row"><a href="#"><img src="Images/Dungeons&Dragons-picture.jpg" alt=""></a></th>
                                                        <td><a href="#" class="text-primary fw-bold">Dungeons & Dragons</a></td>
                                                        <td class="fw-bold">114</td>
                                                        <td>Rs.5,828</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row"><a href="#"><img src="Images/Bholaa-picture.jpg" alt=""></a></th>
                                                        <td><a href="#" class="text-primary fw-bold">Bholaa :IN 3D</a></td>
                                                        <td class="fw-bold">98</td>
                                                        <td>Rs.4,508</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row"><a href="#"><img src="Images/Prasad-2-picture.jfif" alt=""></a></th>
                                                        <td><a href="#" class="text-primary fw-bold">Prasad 2</a></td>
                                                        <td class="fw-bold">74</td>
                                                        <td>Rs.4,366</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row"><a href="#"><img src="Images/Prema-picture.jpeg" alt=""></a></th>
                                                        <td><a href="#" class="text-primary fw-bold">Prema</a></td>
                                                        <td class="fw-bold">63</td>
                                                        <td>Rs.2,016</td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>

                                    </div>
                                </div><!-- End Top Selling -->

                            </div>
                        </div><!-- End Left side columns -->

                        <!-- Right side columns -->
                        <div class="col-lg-4">

                            <div class="card top-selling overflow-auto">

                                <div class="filter">
                                    <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                        <li class="dropdown-header text-start">
                                            <h6>Filter</h6>
                                        </li>
                                    </ul>
                                </div>

                                <div class="card-body pb-0">
                                    <h5 class="card-title">Comming Soon </h5>

                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col">Movie</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach  items="${moviesComming}" var="movie">
                                                <tr>
                                                    <th scope="row"><a href="#"><img src="Images/${movie.picture}" alt=""></a></th>
                                                    <td><a href="#" class="text-primary fw-bold">${movie.title}</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>

                            </div>

                        </div><!-- End Right side columns -->

                    </div>
                </section>

            </main><!-- End #main -->

            <!-- ======= Footer ======= -->
            <footer id="footer" class="footer">
                <div class="copyright">
                    &copy; Copyright <strong><span>Movie Booking</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="#">Anup Maharjan</a>
                </div>
            </footer><!-- End Footer -->

            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

            <!-- Vendor JS Files -->
            <script src="Admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
            <script src="Admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="Admin/assets/vendor/chart.js/chart.umd.js"></script>
            <script src="Admin/assets/vendor/echarts/echarts.min.js"></script>
            <script src="Admin/assets/vendor/quill/quill.min.js"></script>
            <script src="Admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
            <!--<script src="assets/vendor/tinymce/tinymce.min.js"></script>-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/6.4.1/tinymce.min.js" integrity="sha512-in/06qQzsmVw+4UashY2Ta0TE3diKAm8D4aquSWAwVwsmm1wLJZnDRiM6e2lWhX+cSqJXWuodoqUq91LlTo1EA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <!--<script src="Admin/assets/vendor/php-email-form/validate.js"></script>-->

            <!-- Template Main JS File -->
            <script src="Admin/assets/js/main.js"></script>

        </body>

    </html>
