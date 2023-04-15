<%--
    Document   : home
    Created on : Mar 2, 2023, 12:52:49 PM
    Author     : Anup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>AM Movies</title>
    </head>
    <body>
        <%@include file="/include/header.jsp" %>
        <section>
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/Images/Avenger-poster.jpg" class="d-block w-100" alt="...">
                    </div>
                    <c:forEach  items="${moviesList}" var="movie">
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/Images/${movie.poster}" class="d-block w-100" alt="...">
                        </div>
                    </c:forEach>
                    
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <section class="now-showing width-auto align-items-center">
            <div class="top d-flex justify-content-between align-items-center">
                <div class="top-left">Now Showing</div>
                <nav class="top-right d-flex">
                    <ul class="d-flex">
                        <li>Today</li>
                        <li>Tomorrow</li>
                        <li>3 Mar</li>
                    </ul>
                </nav>
            </div>
            <div class="movies d-flex ">
                <c:forEach  items="${moviesReleased}" var="movie">
                    <a class="movie-container" href="${pageContext.request.contextPath}/UserController?page=moviedetails&id=${movie.movie_id}">
                        <img src="${pageContext.request.contextPath}/Images/${movie.picture}" alt="">
                        <p class="movie-title my-1">${movie.title}</p>
                        <p class="movie-gene mb-3">Gene: ${movie.gene}</p>
                    </a>
                </c:forEach>

            </div>
        </section>
        <section class="comming-soon width-auto align-items-center">
            <div class="top d-flex justify-content-between align-items-center">
                <div class="top-left">comming soon</div>
            </div>
            <div class="movies d-flex ">
                <c:forEach  items="${moviesComming}" var="movie">
                    <div class="movie-container">
                        <img src="${pageContext.request.contextPath}/Images/${movie.picture}" alt="">
                        <p class="movie-title my-1">${movie.title}</p>
                        <p class="movie-gene mb-3">Gene: ${movie.gene}</p>
                    </div>
                </c:forEach>

            </div>
        </section>
        <section class="image width-auto">
            <div id="carouselExampleSlidesOnly" style="height: inherit;" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner" style="height: inherit;">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/Images/pic1.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/Images/pic1.png" class="d-block w-100" alt="...">
                    </div>
                </div>
            </div>
        </section>
        <%@include file="/include/footer.jsp" %>
    </body>
</html>
