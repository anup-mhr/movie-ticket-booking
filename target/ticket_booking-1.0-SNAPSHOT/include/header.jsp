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
        <link href="Images/logo3.png" rel="icon">
        <link rel="stylesheet" href="./Style/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>AM Movies</title>
    </head>
    <style>
        /* Step 2) Add CSS:
        Style the input fields and the message box:
        
        Example */
        /* Style all input fields */
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
        }

        /* Style the submit button */
        input[type=submit] {
            background-color: #04AA6D;
            color: white;
        }

        /* Style the container for inputs */
        .container {
            background-color: #f1f1f1;
            padding: 20px;
        }

        /* The message box is shown when the user clicks on the password field */
        #message {
            display: none;
            color: #000;
            position: relative;
            margin: 0;
        }

        /*        #message h3 {
                    margin: 0;
                    color: black;
                    font-size: 12px;
                    text-align: left;
                    padding: 0;
                    height: 30px;
                }*/

        #message p {
            padding: 0;
            font-size: 12px;
            margin: 0;
        }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            color: green;
        }

        .valid:before {
            position: relative;
            left: -35px;
        }

        /* Add a red text color and an "x" icon when the requirements are wrong */
        .invalid {
            color: red;
        }

        .invalid:before {
            position: relative;
            left: -35px;
            /* content: "&#10006;"; */
        </style>
        <body>
            <header class="d-flex align-items-center width-auto">
                <div class="header-left align-items-center d-flex justify-content-between"><img src="Images/logo3.png" alt="" style="height: 45px;
                    width: 140px;">
                    <nav class="d-flex">
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
                                style="background-color: transparent;
                                border-color: transparent;
                                border-radius: 10.25rem;
                                padding: 4px 10px;"
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
                    <p id="close-btn" style="margin: 0;
                    text-align: end;
                    cursor: pointer;">close</p>
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
                        <input type="password" class="form-control" id="as" name="password" required minlength="8">
                        <div class="invalid-feedback">
                            Please enter the password
                        </div>
                    </div>
                    <div id="message">
                        <h3 style="margin: 0;
                        color: black;
                        font-size: 12px;
                        text-align: left;
                        padding: 0;
                        height: 30px;">Password must contain the following:</h3>
                        <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                        <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                        <p id="number" class="invalid">A <b>number</b></p>
                        <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                    </div>
                    <div class="col-md-12">
                        <label for="validationCustom05" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="validationCustom05" name="confirm_password" required minlength="8">
                        <div class="invalid-feedback">
                            Please re-type the password
                        </div>
                    </div>
                    <div class="col-12">
                        <button class="btn" type="submit">Submit form</button>
                    </div>
                    <p id="close-btn" style="margin: 0;
                    text-align: end;
                    cursor: pointer;">close</p>
                </form>
            </div>
            <!-- End Signup form -->

            <!-- Forgot password Start -->
            <div id="forgot-form">
                <form class="row g-3 needs-validation" novalidate action="UserController?page=checkUsername" method="post">
                    <h3>Forgot Password</h3>
                    <div class="col-md-12">
                        <label for="validationCustom03" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="validationCustom03" required>
                        <div class="invalid-feedback">
                            Please enter valid email 
                        </div>
                    </div>
                    <div class="col-12">
                        <button class="btn" type="submit">Check Username</button>
                    </div>
                    <p id="close-btn" style="margin: 0;
                    text-align: end;
                    cursor: pointer;">close</p>
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
            var myInput = document.getElementById("as");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");

            // When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            };

            // When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            };

            // When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }


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

            //// Script to hide  form
            let closeBtns = document.querySelectorAll("#close-btn");
            closeBtns.forEach(function (closeBtn) {
                closeBtn.addEventListener("click", function () {
                    loginForm.style.display = "none";
                    ForgotForm.style.display = "none";
                    SignupForm.style.display = "none";
                    document.getElementById("overlay").style.display = "none";
                });
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
