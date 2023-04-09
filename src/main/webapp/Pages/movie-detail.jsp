<%-- 
    Document   : movie-detail
    Created on : Mar 7, 2023, 4:31:55 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../Style/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>Movie details</title>
    </head>
    <body>
        <%@include file="/include/header.jsp" %>

        <div class="trailer width-auto">
            <iframe src="${movie.video_url}" title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen></iframe>
        </div>
        <section class="movie-details-container width-auto d-flex justify-content-between">
            <img src="${pageContext.request.contextPath}/Images/${movie.picture}" alt="">
            <div class="movie-details" style="width:60%;">
                <h4 class="movie-details-title">${movie.title}</h4>
                <p class="movie-details-description">${movie.description}</p>
                <div class="movie-details-gene d-flex align-items-center">
                    <h6>cast:</h6>
                    <p class="mx-2">${movie.cast}</p>
                </div>
                <div class="movie-details-row-t d-flex">
                    <h6>release date</h6>
                    <h6>duration</h6>
                </div>
                <div class="movie-details-row d-flex">
                    <p>${movie.release_date}</p>
                    <p>${movie.duration}</p>
                </div>
                <div class="movie-details-row-t d-flex">
                    <h6>gene</h6>
                    <h6>director</h6>
                </div>
                <div class="movie-details-row d-flex">
                    <p>${movie.gene}</p>
                    <p>${movie.director}</p>
                </div>
            </div>
        </section>
        <section class="now-showing width-auto align-items-center">
            <div class="top d-flex justify-content-between align-items-center">
                <div class="top-left">view times</div>
                <nav class="top-right d-flex">
                    <ul class="d-flex">
                        <li>Today</li>
                        <li>Tom</li>
                        <li>3 Mar</li>
                    </ul>
                </nav>
            </div>
            <c:forEach  items="${screens}" var="screen">
                <div class="room d-flex align-items-center">
                    <div class="room-name">${screen.name}</div>
                    <div class="room-time d-flex">
                        <c:forEach items="${showtimes}" var="showtime">
                            <c:if test="${screen.screen_id == showtime.screen_id}">
                                <a href="UserController?page=booking&showtime_id=${showtime.showtime_id}">${showtime.start_time}</a>
                            </c:if>
                        </c:forEach>
                        <!--<a href="">02:00 PM</a>-->

                    </div>
                </div>
            </c:forEach>
            <!--            <div class="room d-flex align-items-center">
                            <div class="room-name">Audi 1</div>
                            <div class="room-time d-flex">
                                <a href="">02:00 PM</a>
                                <a href="">02:00 PM</a>
                            </div>
                        </div>-->
        </section>
        <%@include file="/include/footer.jsp" %>

    </body>
</html>
