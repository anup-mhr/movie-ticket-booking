<%-- 
    Document   : reset-password
    Created on : Apr 6, 2023, 9:09:12 PM
    Author     : Anup
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./Style/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>

    </head>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .main-containter{
            justify-content: center;

        }
        .main-containter h2 {
            margin: 25px;
        }
        form{
            display: inline-block
        }
        form label, form input{
            display: block;
        }
    </style>
    <body>
        <!--        <div class="main-containter">
                    <h2>Reset Password</h2>
                    <form action="UserController?page=resetPassword&username=${username}" method="post">
                        <label>Password</label>
                        <input name="password" type="password">
                        <label>Confirm Password</label>
                        <input name="confirmPassword" type="password">
                        <button value="submit">submit</button>
                    </form>
                </div>-->
        <div id="reset-form">
            <form class="row g-3 needs-validation" novalidate action="UserController?page=resetPassword&username=${username}" method="post">
                <h3>Reset Password</h3>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Password</label>
                    <input type="password" class="form-control" id="validationCustom03" name="password" required>
                    <div class="invalid-feedback">
                        Please enter the password
                    </div>
                </div>
                <div class="col-md-12">
                    <label for="validationCustom05" class="form-label">confirm Password</label>
                    <input type="password" class="form-control" id="validationCustom05" name="confirmPassword" required>
                    <div class="invalid-feedback">
                        Please enter the password
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn" type="submit">submit</button>
                </div>
                <a id="close-btn" href="UserController?page=home" style="margin: 0;text-align: end;cursor: pointer;color: black;text-decoration: none;">Back</a>
            </form>
        </div>
    </body>
</html>
