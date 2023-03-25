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
                background-color: #ffa07a;
            }
            /* Define the booked seat style */
            .seat.booked {
                background-color: #c0c0c0;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>
        <h1>Select Your Seats</h1>
        <div class="seat-grid">
            <!-- Add the seats manually -->
            <c:forEach items="${seats}" var="seat">
                <button class="seat">${seat.seat_id}</button>
            </c:forEach>
            <!--            <button class="seat">2</button>
                        <button class="seat">3</button>
                        <button class="seat">4</button>
                        <button class="seat">5</button>
                        <button class="seat">6</button>
                        <button class="seat">7</button>
                        <button class="seat">8</button>
                        <button class="seat">9</button>
                        <button class="seat">10</button>-->
            <!-- Add more seats here -->
        </div>
        <script>
            // Add event listeners to the seats
            const seats = document.querySelectorAll('.seat');
            seats.forEach((seat) => {
                seat.addEventListener('click', () => {
                    if (!seat.classList.contains('booked')) {
                        seat.classList.toggle('selected');
                    }
                });
            });

            let showtime_id = ${showtime_id};   //Getting the showtime_id for sending as parameter

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
