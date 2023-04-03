<%-- 
    Document   : booking
    Created on : Mar 13, 2023, 4:35:28 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie seat selection</title>
        <style>
            /* Define the seat grid */
            .seat-grid {
                display: grid;
                grid-template-columns: repeat(10, 50px);
                grid-gap: 10px;
                margin: 50px;
            }

            /* Define the seat style */
            .seat {
                width: 50px;
                height: 50px;
                background-color: #bfbfbf;
                border: none;
                cursor: pointer;
            }

            /* Define the selected seat style */
            .seat.selected {
                background-color: #387a21;
            }

            /* Define the booked seat style */
            .seat.booked {
                background-color: #a90808;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>
        <%@include file="/include/header.jsp" %>

        <section class="movie-booking width-auto">
            <div class="movie-booking-details">
                <span>Audi A- Chakka Panja</span>
                <span>Tue 2 Mar</span>
                <span>11:00 AM</span>
            </div>
            <div class="screen-box">
                <div class="screen">Screen</div>
                <div class="seat-grid">
                    <!-- Add the seats manually -->
                    <c:forEach items="${seats}" var="seat">
                        <button class="seat">${seat.seat_id}</button>
                    </c:forEach>
                </div>
            </div>
        </section>

        <section class="movie-booking-proceed width-auto d-flex justify-content-between">
            <p id="amount">Amount: <span id="sum">0</span></p>
            <button id="proceed">Proceed</button>
        </section>

        <%@include file="/include/footer.jsp" %>

        <script>
            let showtime_id = ${showtime_id};   //Getting the showtime_id for sending as parameter

            //loading the html before going any further
            document.addEventListener('DOMContentLoaded', () => {
                let sum = 0;
                let amount = document.getElementById("sum");

                const selectedSeats = [];

                //Adding listeenr to the seats
                const seats = document.querySelectorAll('.seat');
                seats.forEach((seat) => {
                    seat.addEventListener('click', () => {
                        if (!seat.classList.contains('booked')) {
                            seat.classList.toggle('selected');

                            //
                            const seatNumber = seat.innerHTML;
                            const index = selectedSeats.indexOf(seatNumber);
                            if (index === -1) {
                                selectedSeats.push(seatNumber);
                                sum += 150;
                            } else {
                                selectedSeats.splice(index, 1);
                                sum -= 150;
                            }
                            amount.innerHTML = sum;

                            console.log(selectedSeats);
                        }
                    });
                });

                //Sending info to servlet
                const proceedBtn = document.getElementById("proceed");
                proceedBtn.addEventListener('click', () => {
                    const selectedSeatsParam = encodeURIComponent(JSON.stringify(selectedSeats));
                    const url = "UserController?page=bookingConfirm&showtime_id=${showtime_id}&selectedSeats="+selectedSeatsParam;
                    window.location.href = url;
                });



            });



            // Send an AJAX request to the server to retrieve the JSON data   
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var seatIds = JSON.parse(xhr.responseText); // Parse the JSON data into an array
                    console.log(seatIds);       // Print the array to the console
                    console.log(seatIds.includes(30));
                    // Marking the booked element
                    const seats = document.querySelectorAll('.seat');
                    seats.forEach((seat) => {
                        let html = seat.innerHTML;
                        if (seatIds.includes(parseInt(html))) {
                            seat.classList.toggle('booked');
                        }
                    });
                }
            };
            xhr.open("GET", "/ticket_booking/getBooked?showtime_id=" + showtime_id, true);
            xhr.send();

        </script>
    </body>
</html>
