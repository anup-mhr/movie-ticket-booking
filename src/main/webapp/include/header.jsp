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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
            <form action="${pageContext.request.contextPath}/UserController?page=existing" method="post">
                <h3>Login</h3>

                <label for="username">Username</label>
                <input type="text" name="username" placeholder="Username">

                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Password">

                <button type="submit"> LOGIN</button>

                <span><a href="">Forgot password?</a> or <a href="">Sign up</a></span><br>
            </form>
        </div>

    </body>

    <script>
        // script to show the login form 
        const loginButton = document.getElementById("login-button");
        const loginForm = document.getElementById("login-form");

        loginButton.addEventListener("click", function () {
            loginForm.style.display = "block";
            document.getElementById("overlay").style.display = "block";
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            checkLoginStatus().then((isLoggedIn) => {
                console.log(isLoggedIn)
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
