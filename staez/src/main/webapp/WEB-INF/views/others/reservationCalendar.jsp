<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/others/reservationCalendar.css">

<title>Insert title here</title>
</head>
<body>
	<header>
        <jsp:include page="../common/header.jsp" />
		<script src="${contextPath}/resources/js/api/othersapi.js"></script>
    </header>
    <main>
        <div id="concert-reservation-calendar-area">
			<div id="concert-calendar-choice" onclick="location.href='calendar.co'">
				<span>공연 캘린더</span>
            </div>
            <div id="reservation-calendar-choice">
				<span style="color: #B51B75;">나의 예매 캘린더</span>
            </div>
        </div>
		<div id="calendar-container">
			<input type="hidden" value="${loginUser.userNo}" name="userNo">
			<div class="concert-calendar-area">
				<div class="concert-calendar-title-area"><h1>예매 날짜</h1></div>
				<div class="calendar">  
					<div class="calendar-top">
						<button id="previous"></button>
						<h3></h3>
						<button id="next"></button>
					</div>
					<div class="days-area">
						<ul class="days">
							<li>일</li>
							<li>월</li>
							<li>화</li>
							<li>수</li>
							<li>목</li>
							<li>금</li>
							<li>토</li>
						</ul>
						<ul class="dates">
							<!-- 스크립트 이용해서 넣을 것 -->
						</ul>
					</div>
				</div>
			</div>
            <div class="reservation-day-list-area">
				<div class="reservation-list-title-area"><h1>예매 목록</h1></div>
				<div class="reservation-list-day">
                    <div class="reservation-day"><span class="reservation-day-span"></span></div>
				</div>
				<div class="reservation-day-info-area">
					
				</div>
			</div>
        </div>
        <script src="${contextPath}/resources/js/others/reservationCalendar.js"></script>
    </main>
    <footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>