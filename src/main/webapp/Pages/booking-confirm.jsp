<%-- 
    Document   : booking-confirm
    Created on : Mar 7, 2023, 4:30:02 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="../Style/style.css">-->
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
                        <li><label>movie</label><span>${showtime_details.title}</span></li>
                        <li><label>screen</label><span>${showtime_details.name}</span></li>
                        <li><label>date</label><span>${currentDate}</span></li>
                        <li><label>time</label><span>${showtime_details.start_time}</span></li>
                        <li><label>seats</label><span><c:out value="${totalSeats}"/></span></li>
                    </ul>
                </div>
            </div>
            <div class="confirm-booking" style="width: 55%;">
                <h6>Your Shopping Cart</h6>
                <div class="confirm-booking-body">
                    <ul>
                        <li class="confirm-booking-body-calculate d-flex justify-content-between py-3"><label>Seats</label><span class="confirm-booking-body-span"><c:out value="${totalSeats} "/>*</span><span class="confirm-booking-body-span">Rs. 150.00</span></li>
                        <li class="confirm-booking-body-calculate d-flex justify-content-between py-3"><label>Sub total</label><span class="confirm-booking-body-span">Rs. <c:out value="${final_price}"/>0</span></li>
                        <li class="d-flex justify-content-between py-3"><label>Total</label><span class="confirm-booking-body-span">Rs. <c:out value="${final_price}"/>0</span></li>
                    </ul>
                </div>
            </div>
        </section>
        <div class="width-auto"style="margin:30px auto 50px auto;">
            <a href="${pageContext.request.contextPath}/UserController?page=BookingBilling" class="buy-now">Buy Now</a>
        </div>
        <%@include file="/include/footer.jsp" %>

    </body>
</html>
