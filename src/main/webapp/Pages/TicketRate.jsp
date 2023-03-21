<%-- 
    Document   : TicketRate
    Created on : Mar 7, 2023, 4:34:13 PM
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
        <title>Ticket Rate</title>
    </head>
    <body>
        <%@include file="/include/header.jsp" %>

        <section>
            <div class="about-us width-auto">
                <h1 class="about-us-title">Ticket Rates</h1>
            </div>
        </section>
        <section class="ticket width-auto">
            <div class="ticket-container">
                <div class="ticket-container-header d-flex justify-content-between"><h4>weekends(saturday & sunday)</h4><h4>ticket rate</h4></div>
                <div class="ticket-container-body d-flex justify-content-between"><p>Morning show</p><p>Rs.175.00</p></div>
                <div class="ticket-container-body d-flex justify-content-between"><p>Regular show</p><p>Rs.200.00</p></div>
            </div>
            <div class="ticket-container">
                <div class="ticket-container-header d-flex justify-content-between"><h4>weekends(monday & thursday)</h4><h4>ticket rate</h4></div>
                <div class="ticket-container-body d-flex justify-content-between"><p>Morning show</p><p>Rs.175.00</p></div>
                <div class="ticket-container-body d-flex justify-content-between"><p>Regular show</p><p>Rs.200.00</p></div>
            </div>
            <div class="ticket-container">
                <div class="ticket-container-header d-flex justify-content-between"><h4>Deals(Tuesday, wednesday $ friday)</h4><h4>ticket rate</h4></div>
                <div class="ticket-container-body d-flex justify-content-between"><p>Morning show</p><p>Rs.175.00</p></div>
                <div class="ticket-container-body d-flex justify-content-between"><p>Regular show</p><p>Rs.200.00</p></div>
            </div>
            <p>
                FOR ADVANCE BOOKING CALL:- 01-4011643 / 4011645 

                Tickets once sold are neither refundable nor exchangable (For more details please read security procedure)
                Kindly note that schedule & tickets price are subject to change by Management decision.
            </p>
        </section>
        <%@include file="/include/footer.jsp" %>

    </body>
</html>
