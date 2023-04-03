<%-- 
    Document   : booking-billing
    Created on : Apr 2, 2023, 8:46:14 PM
    Author     : Anup
--%>

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
    <div  class="ticket-body">
        <div class="ticket" id="content">
          <div class="holes-top"></div>
          <div class="title">
            <p class="cinema">MyShowz Entertainment</p>
            <p class="movie-title">Movie Name</p>
          </div>
          <div class="poster">
            <img src="${pageContext.request.contextPath}/Images/pic1.png"
              alt="Movie: Only God Forgives" />
          </div>
          <div class="info" >
            <table class="info-table ticket-table">
              <tr>
                <th>SCREEN</th>
                <th>ROW</th>
                <th>SEAT</th>
              </tr>
              <tr>
                <td class="bigger">18</td>
                <td class="bigger">H</td>
                <td class="bigger">24</td>
              </tr>
            </table>
            <table class="info-table ticket-table">
              <tr>
                <th>PRICE</th>
                <th>DATE</th>
                <th>TIME</th>
              </tr>
              <tr>
                <td>RS.120</td>
                <td>4/13/21</td>
                <td>19:30</td>
              </tr>
            </table>
          </div>
          <div class="holes-lower"></div>
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

    <button id="download-btn">Download PDF</button>

    <script>
        function onClick() {
            var content = document.getElementById("content").innerHTML;
            var pdf = new jsPDF('p', 'pt', 'letter');

            // Get the width and height of the text content
            var textWidth = pdf.getTextWidth(content);
            var textHeight = pdf.getTextDimensions(content).h;

            // Set the canvas size to match the content size
            pdf.canvas.height = textHeight + 20; // add some padding
            pdf.canvas.width = textWidth + 20;

            pdf.fromHTML(content);

            pdf.save('test.pdf');
        };

        var element = document.getElementById("download-btn");
        element.addEventListener("click", onClick);
    </script>

</body>

</html>
