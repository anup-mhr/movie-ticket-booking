<%-- 
    Document   : header
    Created on : Mar 2, 2023, 12:52:15 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./Style/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="d-flex align-items-center width-auto">
            <div class="header-left header-left d-flex justify-content-between"><img src="" alt="">
                <nav class="d-flex ">
                    <ul class="d-flex">
                        <li><a href="${pageContext.request.contextPath}/UserController?page=home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/UserController?page=TicketRate">Ticket Rate</a></li>
                        <li><a href="${pageContext.request.contextPath}/UserController?page=AboutUs">About Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="header-right d-flex justify-content-end">
                <button id="login-button">Login</button>

                <div class="dropdown" id="username-button">
                    <button class="btn btn-secondary dropdown-toggle username-label"
                            style="background-color: transparent; border-color: transparent; border-radius: 10.25rem; padding: 4px 10px;"
                            type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                        Username
                    </button>
                    <ul class="dropdown-menu dropdown-menu-dark" style="background-color: #701313;"
                        aria-labelledby="dropdownMenuButton2">
                        <li><a class="dropdown-item" href="#">Account</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="UserController?page=logout">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </header>

        <!-- for making the background little dark -->
        <div id="overlay"></div>

        <!-- login form -->
        <div id="login-form">
            <form class="row g-3 needs-validation" novalidate action="${pageContext.request.contextPath}/UserController?page=existing" method="post">
                <h3>Login</h3>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Username</label>
                    <input type="text" class="form-control" id="validationCustom03" name="username" required>
                    <div class="invalid-feedback">
                        Please enter the username
                    </div>
                </div>
                <div class="col-md-12">
                    <label for="validationCustom05" class="form-label">Password</label>
                    <input type="password" class="form-control" id="validationCustom05" name="password" required>
                    <div class="invalid-feedback">
                        Please enter the password
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn" type="submit">Login</button>
                </div>
                <span><a id="forgot-button">Forgot password?</a> or <a id="signup-button">Sign up</a></span><br>
            </form>
        </div>

        <!-- Signup form Start -->
        <div id="signup-form">
            <form class="row g-3 needs-validation" novalidate action="${pageContext.request.contextPath}/UserController?page=register" method="post">
                <h3>Signup</h3>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Username</label>
                    <input type="text" class="form-control" id="validationCustom03" name="username" required>
                    <div class="invalid-feedback">
                        Please enter the username
                    </div>
                </div>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Email</label>
                    <input type="email" class="form-control" id="validationCustom03" name="email" required>
                    <div class="invalid-feedback">
                        Please enter the Email
                    </div>
                </div>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Password</label>
                    <input type="password" class="form-control" id="validationCustom03" name="password" required minlength="8">
                    <div class="invalid-feedback">
                        Please enter the password
                    </div>
                </div>
                <div class="col-md-12">
                    <label for="validationCustom05" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="validationCustom05" name="confirm_password" required minlength="8">
                    <div class="invalid-feedback">
                        Please re-type the password
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Agree to terms and conditions
                        </label>
                        <div class="invalid-feedback">
                            You must agree before submitting.
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn" type="submit">Submit form</button>
                </div>
            </form>
        </div>
        <!-- End Signup form -->

        <!-- Forgot password Start -->
        <div id="forgot-form">
            <form class="row g-3 needs-validation" novalidate action="forgotPassword" method="post">
                <h3>Forgot Password</h3>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Email</label>
                    <input type="email" class="form-control" id="validationCustom03" required>
                    <div class="invalid-feedback">
                        Please enter valid email 
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn" type="submit">Send code</button>
                </div>
            </form>
        </div>
        <!-- End Forgot Password -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!-- Vendor JS Files -->
        <script src="Pages/assets/vendor/tinymce/tinymce.min.js"></script>

        <!-- Template Main JS File -->
        <script src="Pages/assets/js/main.js"></script>

    </body>

    <script>
        // script to show the login form 
        const loginButton = document.getElementById("login-button");
        const loginForm = document.getElementById("login-form");

        loginButton.addEventListener("click", function () {
            loginForm.style.display = "block";
            document.getElementById("overlay").style.display = "block";
        });

        // Script to show signup form
        const SignupButton = document.getElementById("signup-button");
        const SignupForm = document.getElementById("signup-form");

        SignupButton.addEventListener("click", function () {
            loginForm.style.display = "none";
            SignupForm.style.display = "block";
            document.getElementById("overlay").style.display = "block";
        });

        // Script to show forgot form
        const ForgotButton = document.getElementById("forgot-button");
        const ForgotForm = document.getElementById("forgot-form");

        ForgotButton.addEventListener("click", function () {
            loginForm.style.display = "none";
            ForgotForm.style.display = "block";
            document.getElementById("overlay").style.display = "block";
        });
        
        document.addEventListener('DOMContentLoaded', () => {
            checkLoginStatus().then((isLoggedIn) => {
                console.log(isLoggedIn);
                if (isLoggedIn) {
                    // show logged in user's username
                    loginButton.style.display = 'none';
                    console.log(getSessionUsername());
                    getSessionUsername().then((username) => {
                        document.getElementById("dropdownMenuButton2").textContent = username;
                    });
                    document.getElementById("username-button").style.display = 'block';
                } else {
                    // show login button
                    document.getElementById("login-button").style.display = "block";
                    document.getElementById("username-button").style.display = 'none';
                }
            });
        });


        function checkLoginStatus() {
            return new Promise((resolve, reject) => {
                const xhr = new XMLHttpRequest();
                xhr.open("GET", "/ticket_booking/checkLoginStatus");
                xhr.onload = () => {
                    if (xhr.status === 200) {
                        resolve(true); // user is logged in
                    } else {
                        resolve(false); // user is not logged in
                    }
                };
                xhr.onerror = () => reject(xhr.statusText);
                xhr.send();
            });
        }



        function getSessionUsername() {
            return fetch('/ticket_booking/getSessionUsername')
                    .then(response => response.text())
                    .catch(error => console.error(error));
        }
    </script>        
</html>
