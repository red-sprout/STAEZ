<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/concert/concertReserveLastStep.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <div id="timer"></div>
	</div>
    <script>
        let seconds = 5;

        function updateTimer() {
            
            seconds--;
            document.getElementById("timer").innerText = seconds+"초 후에 자동으로 꺼집니다.";

            if(seconds == 0){
                window.close()
            }
        }

        setInterval(updateTimer, 1000);
    </script>
    <style>
        #timer{
            font-size: 50px;
        }
    </style>
</body>
</html>