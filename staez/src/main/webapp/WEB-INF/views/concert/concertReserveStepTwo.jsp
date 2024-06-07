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
<link rel="stylesheet" href="${contextPath}/resources/css/concert/concertReserveStepTwo.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="reserve-step-area-top">
            <span>STAEZ 티켓예매</span>
            <div class="reserve-step-area">
                <div class="step-one"><span>02 좌석선택</span></div>
                <div class="step-two" id="step-two-info">
                    <div>
                        <span id="step-two-concert-title">${concert.concertTitle}</span>
                        <span class="step-two-top-span"> | ${concert.theaterName}</span>
                    </div>
                    <div>
                        <span class="step-two-top-span">선택한 일시: </span>
                        <span class="step-two-top-span reserve-date">${reserveDate}</span>
                    </div>
                </div>
               
               <input type="hidden" name="theaterName" value="${concert.theaterName}">
            </div>
        </div>
        <div class="reserve-step-content-area">
            <div class="seat-choice-container">
                <div class="seat-ui">
                    <table>
                        <thead>
                            <tr class="thead-tr">
                                <!-- <th></th>
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                                <th>6</th>
                                <th>7</th>
                                <th>8</th>
                                <th>9</th>
                                <th>10</th>
                                <th>11</th>
                                <th>12</th>
                                <th>13</th>
                                <th>14</th>
                                <th>15</th> -->
                            </tr>
                        </thead>
                        <tbody class="tbody">
                            <!-- <tr>
                                <th>A</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="seat-choice-info-container">
                <div class="seat-rating-choice-area">
                    <div class="remaining-seat-rating-area">
                        <span>좌석등급/잔여석</span>
                    </div>
                    <div class="remaining-rating-info">
                        
                    </div>
                    <div class="remaining-seat-rating-area">
                        <span>선택좌석</span>
                    </div>
                    <div class="remaining-seat-info">
                        <!-- <div class="seat-info"><span>1-1(R석)</span></div> -->

                    </div>
                    <div class="total-payment-amount-area">
                        <span>총 결제금액</span>
                        <div>
                            <span id="amount">0</span>
                            <span>원</span>
                        </div>
                    </div>
                    <div class="next-and-back-area">
                        <div class="back-step-area" onclick="history.go(-1)">
                            <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                            <span>이전단계</span>
                        </div>
                        <form action="selectMember.co" class="next-btn-form hidden" method="POST">
                            <input type="hidden" name="userNo" value="${userNo}">
                            <input type="hidden" name="cNo" value="${concert.concertNo}">
                            <input type="hidden" name="reserveDate" value="${reserveDate}">
                            <input type="hidden" name="totalAmount" value="" >
                            <input type="hidden" name="seatList" value="">
                            <div class="next-step-area">
                                <button id="next-btn">다음단계</button>
                                <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                            </div>
                        </form>
                  </div>
                </div>
            </div> 
        </div>
        <script src="${contextPath}/resources/js/api/concertReserveapi.js"></script>
        <script src="${contextPath}/resources/js/concert/concertReserveStepTwo.js"></script>
	</div>
</body>
</html>