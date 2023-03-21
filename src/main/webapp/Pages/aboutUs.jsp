<%-- 
    Document   : aboutUs
    Created on : Mar 7, 2023, 4:27:28 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../Style/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>About Us</title>
    </head>
    <body>
        <%@include file="/include/header.jsp" %>
        <section>
            <div class="about-us width-auto">
                <h1 class="about-us-title">about us</h1>
            </div>
            <div class="about-us-lower d-flex width-auto">
                <div class="about-us-discreption align-items-center">
                    <p>The company itself is a very successful company. Therefore, 
                        the escape from experience is easy for the great, but can 
                        we just do some duties with these pleasures? Does he accept the inventor?</p>
                    <p>The company itself is a very successful company. Therefore, the escape from experience
                        is easy for the great, but can we just do some duties with these 
                        pleasures? Does he accept the inventor?</p>
                </div>
                <div class="about-us-photo"></div>
            </div>
        </section>
        <%@include file="/include/footer.jsp" %>
    </body>
</html>
