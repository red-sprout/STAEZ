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
<link rel="stylesheet" href="${contextPath}/resources/css/concert/concertReserveStepOne.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <div class="reserve-step-area-top">
            <span>STAEZ 티켓예매</span>
            <div class="reserve-step-area">
                <div class="step-one"><span>01 관람일/회차선택</span></div>
                <div class="step-two"><span>02 좌석선택</span></div>
                <div class="step-three"><span>03 주문자확인</span></div>
                <div class="step-four"><span>04 결제하기</span></div>
            </div>
        </div>
        <div class="reserve-step-content-area">
            <div class="viewing-date-and-round-area">
                <div class="viewing-date-and-round-choice-area">
                    <div class="viewing-date-choice-area">
                        <span>관람일 선택</span>
                        <div class="viewing-date-calendar">
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
                    </div>
                    <div class="round-time-choice-area">
                        <div class="choice-date-span-area"><span class="choice-date-span"></span></div>
                        <div class="round-area"><span>회차(관람시간)</span></div>
                        <div class="round-time-area">
                            <span>14시 00분</span>
                        </div>
                        <div class="round-time-area choice-time">
                            <span>16시 00분</span>
                        </div>
                        <div class="round-time-area">
                            <span>20시 00분</span>
                        </div>
                    </div>
                    <div class="seat-rating-choice-area"></div>
                </div>
                <div class="precautions-area">

                </div>
            </div>
            <div class="concert-reserve-area"></div>
        </div>
        <script src="${contextPath}/resources/js/concert/concertReserveStepOne.js"></script>
    </div>
</body>
</html>