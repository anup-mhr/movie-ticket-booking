<%-- 
    Document   : billing
    Created on : Apr 6, 2023, 9:40:48 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            .content {
                background-color: beige;
                height: 400px;
                width: 40%;
                margin: 0 140px;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
            }

            #content h3 {
                color: red;
                text-align: center;

                font-size: 30px;

            }

            h3 {
                padding-top: 20px;
            }

            h2 {

                font-size: 15px;
                text-align: center;
            }



            .footer p {
                text-align: center;
                margin-top: 30px;
            }

            .content-page {
                display: flex;
                margin-top: 50px;
                margin-left: 20px;
                gap: 75px;
                ;
            }

            h5{
                margin-left: 30px;
                font-size: 15px;
            }
            .content-page p{
                margin-left: 30px;
                margin-top: 10px;
            }
            .content-page2 {
                display: flex;
                margin-top: 30px;
                margin-left: 20px;
                gap: 143px;
            }
            .content-page2 p{
                margin-left: 28px;
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <div class="content" id="content">
            <h3>AM movie</h3>

            <h2>Entrance pass</h2>
            <div class="content-page">
                <div class="pass">
                    <h5>Screen Name</h5>
                    <p>A Block</p>
                </div>
                <div class="Seat">
                    <h5> Seat</h5>
                    <p>A63gdy</p>
                </div>
                <div class="Movie">
                    <h5> Movie name</h5>
                    <p>dcavcyavcy</p>
                </div>
            </div>

            <div class="content-page2">
                <div class="pass">
                    <h5>Price</h5>
                    <p>12</p>
                </div>
                <div class="Seat">
                    <h5> Date</h5>
                    <p>12 Dec 2022</p>
                </div>
                <!-- <div class="Movie">
                    <h5> Time</h5>
                    <p>12:00</p>
                </div> -->
            </div>



            <div class="footer">
                <p>Enjoy your movie!!</p>
            </div>
        </div>
    </div>
    <!-- <div id="editor">
        <button id="cmd">Generate PDF</button>
    </div> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"
            integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/"
    crossorigin="anonymous"></script>

</body>
<script>
    var doc = new jsPDF();
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#cmd').click(function () {
        doc.fromHTML($('#content').html(), 15, 15, {
            'width': 170,
            'elementHandlers': specialElementHandlers
        });
        doc.save('sample-file.pdf');
    });
</script>

</html>