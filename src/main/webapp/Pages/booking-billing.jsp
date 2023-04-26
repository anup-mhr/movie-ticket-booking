<%-- 
    Document   : booking-billing
    Created on : Apr 2, 2023, 8:46:14 PM
    Author     : Anup
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="./Pages/assets/css/e-ticket.css">
        <link rel="stylesheet" type="text/css" href="./Pages/assets/css/style-starter.css">
        <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">
    </head>


    <body>
        <%@include file="/include/header.jsp" %>
        <div  class="ticket-body">
            <div class="ticket" id="content">
                <div class="title">
                    <p class="cinema">AM Movies</p>
                    <p class="movie-title">${transaction.movie_name}</p>
                </div>
                <div class="poster">
                    <img src="${pageContext.request.contextPath}/Images/${movie_img}" alt="Movie: ${transaction.movie_name}" style="width: 100%;height: 200px;" />
                </div>
                <div class="info" >
                    <table class="info-table ticket-table">
                        <tr>
                            <th>SCREEN</th>
                            <th>ROW</th>
                            <th>SEAT</th>
                        </tr>
                        <tr>
                            <td class="bigger">${transaction.screen}</td>
                            <td class="bigger">H</td>
                            <td class="bigger">${transaction.seats}</td>
                        </tr>
                    </table>
                    <table class="info-table ticket-table">
                        <tr>
                            <th>PRICE</th>
                            <th>DATE</th>
                            <th>TIME</th>
                        </tr>
                        <tr>
                            <td>RS.${transaction.total_price}</td>
                            <td>${transaction.date}</td>
                            <td>${transaction.start_time}</td>
                        </tr>
                    </table>
                </div>
                <div class="serial">
                    <table class="barcode ticket-table">
                        <tr>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                            <td style="background-color:black;"></td>
                            <td style="background-color:white;"></td>
                        </tr>
                    </table>
                    <table class="numbers ticket-table">
                        <tr>
                            <td>9</td>
                            <td>1</td>
                            <td>7</td>
                            <td>3</td>
                            <td>7</td>
                            <td>5</td>
                            <td>4</td>
                            <td>4</td>
                            <td>4</td>
                            <td>5</td>
                            <td>4</td>
                            <td>1</td>
                            <td>4</td>
                            <td>7</td>
                            <td>8</td>
                            <td>7</td>
                            <td>3</td>
                            <td>4</td>
                            <td>1</td>
                            <td>4</td>
                            <td>5</td>
                            <td>2</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div style="text-align: center; margin: 10px auto;">                    
            <button id="download-btn">Download PDF</button>
        </div>
        <script>
            function onClick() {
                let content = document.getElementById("content").innerHTML;
                let pdf = new jsPDF('p', 'pt', 'letter');

                // Get the width and height of the text content
                let textWidth = pdf.getTextWidth(content);
                let textHeight = pdf.getTextDimensions(content).h;

                // Set the canvas size to match the content size
                pdf.canvas.height = textHeight + 20; // add some padding
                pdf.canvas.width = textWidth + 20;

                pdf.fromHTML(content);

                pdf.save('bill.pdf');
            }
            ;

            let element = document.getElementById("download-btn");
            element.addEventListener("click", onClick);
        </script>
        <%@include file="/include/footer.jsp" %>
    </body>

</html>
