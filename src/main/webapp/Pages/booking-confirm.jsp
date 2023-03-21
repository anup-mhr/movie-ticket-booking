<%-- 
    Document   : booking-confirm
    Created on : Mar 7, 2023, 4:30:02 PM
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
        <title>booking confirm</title>
    </head>
    <body>
        <%@include file="/include/header.jsp" %>

        <section class="confirm-img ">
            <img src="random.jpg" alt="">
        </section>
        <section class="confirm-booking-container d-flex width-auto justify-content-between">
            <div class="confirm-booking "style="width: 40%;">
                <h6>Your Summary Panel</h6>
                <div class="confirm-booking-body">
                    <ul>
                        <li><label>movie</label><span>Fulbari</span></li>
                        <li><label>screen</label><span>audi 1</span></li>
                        <li><label>date</label><span>02/03/2023</span></li>
                        <li><label>time</label><span>06:45 PM</span></li>
                        <li><label>seats</label><span>12</span></li>
                    </ul>
                </div>
            </div>
            <div class="confirm-booking" style="width: 55%;">
                <h6>Your Sopping Cart</h6>
                <div class="confirm-booking-body">
                    <ul>
                        <li class="confirm-booking-body-calculate d-flex justify-content-between py-3"><label>Seats</label><span class="confirm-booking-body-span">1*</span><span class="confirm-booking-body-span">Rs. 300.00</span></li>
                        <li class="confirm-booking-body-calculate d-flex justify-content-between py-3"><label>Sub total</label><span class="confirm-booking-body-span">Rs. 300.00</span></li>
                        <li class="d-flex justify-content-between py-3"><label>Total</label><span class="confirm-booking-body-span">Rs. 300.00</span></li>
                    </ul>
                </div>
            </div>
        </section>
        <div class="width-auto"style="margin:30px auto 50px auto;">
            <a href="" class="buy-now">Buy Now</a>
        </div>
        <%@include file="/include/footer.jsp" %>

    </body>
</html>
