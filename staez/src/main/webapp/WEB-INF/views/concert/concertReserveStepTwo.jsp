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
                        <span id="step-two-concert-title">뮤지컬 <천개의 파랑></span>
                        <span class="step-two-top-span"> | 예술의 전당 CJ 토월극장</span>
                    </div>
                    <div>
                        <span class="step-two-top-span">선택한 일시: </span>
                        <span class="step-two-top-span"> 0000-00-00 00시00분</span>
                    </div>
                </div>
               
            </div>
        </div>
        <div class="reserve-step-content-area">
            <div class="seat-choice-container">
                <li class="seat-ui">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
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
                                <th>15</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
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
                            </tr>
                            <tr>
                                <th>B</th>
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
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>C</th>
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
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>D</th>
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
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>E</th>
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
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                        </tbody>
                    </table>
                </li>
            </div>
            <div class="seat-choice-info-container">
                <div class="seat-rating-choice-area">
                    <div class="remaining-seat-rating-area">
                        <span>좌석등급/잔여석</span>
                    </div>
                    <div class="remaining-rating-info">
                        <div class="rating-area">
                            <div class="rating-color"></div>
                            <span class="rating-name">R석</span>
                            <img class="divide" src="${contextPath}/resources/img/concert/divide.png" alt="">
                            <span class="seat-count">73석</span>
                            <span class="seat-rating-mount">90,000원</span>
                        </div>
                        <div class="rating-area">
                            <div class="rating-color"></div>
                            <span class="rating-name">S석</span>
                            <img class="divide" src="${contextPath}/resources/img/concert/divide.png" alt="">
                            <span class="seat-count">73석</span>
                            <span class="seat-rating-mount">60,000원</span>
                        </div>
                        <div class="rating-area">
                            <div class="rating-color"></div>
                            <span class="rating-name">A석</span>
                            <img class="divide" src="${contextPath}/resources/img/concert/divide.png" alt="">
                            <span class="seat-count">73석</span>
                            <span class="seat-rating-mount">30,000원</span>
                        </div>
                    </div>
                    <div class="remaining-seat-rating-area">
                        <span>선택좌석</span>
                    </div>
                    <div class="remaining-seat-info">
                        <div>
                            <div><span>좌석등급</span></div>
                            <span class="choice-rating-value">R석</span>
                        </div>
                        <div>
                            <div><span>좌석번호</span></div>
                            <span  class="choice-seat-value">A열 1번</span>
                        </div>
                    </div>
                    <div class="total-payment-amount-area">
                        <span>총 결제금액</span>
                        <div>
                            <span id="amount">90,000</span>
                            <span>원</span>
                        </div>
                    </div>
                    <div class="next-and-back-area">
                        <div class="back-step-area" onclick="history.go(-1)">
                            <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                            <span>이전단계</span>
                        </div>
                        <div class="next-step-area"  onclick="location.href='selectMember.co'">
                            <span>다음단계</span>
                            <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                        </div>
                  </div>
                </div>
            </div> 
        </div>
        <script src="${contextPath}/resources/js/concert/concertReserveStepTwo.js"></script>
	</div>
</body>
</html>