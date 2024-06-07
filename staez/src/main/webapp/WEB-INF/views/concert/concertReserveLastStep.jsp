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
            <div class="orderer-reserver-area">
                <div class="receive-way-area">
                    <span>결제방식선택</span>
                    <div class="receive-way-box">
                        <div class="check-div"><div></div></div>
                        <span>무통장입금</span>
                    </div>
                </div>
                <div class="line">
                    <div></div>
                    <img src="${contextPath}/resources/img/concert/lineArrow.png" alt="">
                </div>
                <div class="reservation-check-area">
                    <span>결제수단</span>
                    <div class="reservation-input-area">
						<div>
							<span>></span><span>무통장입금</span>
						</div>
						<div class="deposit-amount-area">
							<div><span>입금액</span></div>
							<span class="deposit-amount">${totalAmount}</span>
							<span>원</span>
						</div>
						<div class="deposit-bank-area">
							<div><span>입금하실은행</span></div>
							<span class="deposit-bank">국민은행</span>
						</div>
						<div class="deposit-closing-time-area">
							<div><span>입금마감시간</span></div>
							<span class="deposit-closing-time"></span>
						</div>
						<div class="deposit-name-area">
							<div><span>예금주명</span></div>
							<span class="deposit-name">김효영</span>
						</div>
                        <span class="emphasis-text">*입금계좌는 예매하기 완료 후 결제내역에서 확인!</span>
                    </div>
                </div>
            </div>
            <div class="concert-reserve-area">
                <div class="concert-reserve-info-area">
                    <img class="concert-reserve-info-img" src="${contextPath}${concert.path}" alt="">
                    <div class="concert-reserve-info-content">
                        <span>${concert.concertTitle}</span>
                        <span>${concert.startDate} ~ ${concert.endDate}</span>
                        <span>${concert.theaterName}</span>
                        <span>${concert.ageLimit}</span>
                        <span>관람시간 : ${concert.concertRuntime}분</span>
                    </div>
                </div>
                <div class="my-reserve-info-area">
                    <span class="my-reserve-info-top">My 예매정보</span>
                    <div class="my-reserve-info">
                        <div class="my-reserve-time">
                            <div><span>일시</span></div>
                            <span class="my-reserve-time-value">${reserveDate}</span>
                        </div>       
                    </div>  
                    <div class="my-reserve-info plus-css">
                        <div class="my-reserve-time">
                            <div><span>선택좌석</span></div>
                            <div class="my-reserve-time-area">
                             
                                <c:forEach var="s" items="${seatList}">
                                    <div class="my-seat-info">
                                        <span class="my-seat-info-span">${s.seat}</span>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>       
                    </div>  
                </div>
                <div class="total-payment-amount-area">
                    <span>총 결제금액</span>
                    <div>
                        <span id="amount">${totalAmount}</span>
                        <span>원</span>
                    </div>
                </div>
                <div class="next-and-back-area">
                    <div class="back-step-area" onclick="history.go(-1)">
                        <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                        <span>이전단계</span>
                    </div>
                    <form action="insertReserve.co" class="next-step-form">
                        <input type="hidden" name="userNo" value="${userNo}">
                        <input type="hidden" name="concertNo" value="${concert.concertNo}">
                        <input type="hidden" name="recipientName" value="${recipientName}">
                        <input type="hidden" name="recipientPhone" value="${recipientPhone}">
                        <input type="hidden" name="recipientBirth" value="${recipientBirth}">
                        <input type="hidden" name="concertDate">
                        <input type="hidden" name="schedule">
                        <input type="hidden" name="seatList">
                        <button class="next-step-area" onclick="insertReserve()">
                            <span>예매하기</span>
                            <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                        </button>
                    </form>
              </div>
            </div>
         </div>
	
		<script src="${contextPath}/resources/js/concert/concertReserveLastStep.js"></script>
	</div>

</body>
</html>