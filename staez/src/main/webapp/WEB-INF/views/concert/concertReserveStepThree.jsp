<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>          
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/concert/concertReserveStepThree.css">
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
                    <span>티켓수령방법</span>
                    <div class="receive-way-box">
                        <div class="check-div"><div class="checked"></div></div>
                        <span>현장수령</span>
                    </div>
                </div>
                <div class="line">
                    <div></div>
                    <img src="${contextPath}/resources/img/concert/lineArrow.png" alt="">
                </div>
                <div class="reservation-check-area">
                    <span>예매자확인</span>
                    <p class="important-span">(현장 수령받을 실 분의 정보)</p>
                    <button class="before-info" onclick="reserveInfoSame(this)">예매자 정보와 동일</button>
                    <div class="reservation-input-area">
                        <div class="reservation-user-name">
                            <div><span>이름</span><span class="important-star">*</span></div>
                            <input type="text" name="name" value="">
                        </div>
                        <div class="reservation-user-birthdate">
                            <div><span>생년월일</span><span class="important-star">*</span></div>
                            <input type="text" value="" name="birth" onblur="checkBirth(this)">
                            <span>예) 1985-01-01(YYYY-MM-DD)</span>
                        </div>
                        <div class="check-birth check hidden"><span>생년월일을 YYYY-MM-DD 형식에 맞게 입력해주세요.</span></div>
                        <div class="reservation-user-phone">
                            <div><span>휴대폰</span><span class="important-star">*</span></div>
                            <input type="text" name="phone" maxlength="15" placeholder="- 제외" value="" onblur="checkPhone(this)">
                        </div>
                        <div class="check-phone check hidden"><span>휴대전화 번호를 '-'제외 11자리 숫자로 입력해주세요.</span></div>
                        <div class="emphasis-text"><span>현장수령 및 고객문의시 본인확인을 위해 정확한 정보를 입력해주세요.</span></div>
                        <div class="reservation-user-email">
                            <div><span>이메일</span><span class="important-star">*</span></div>
                            <input type="text" name="email" placeholder="@ 포함" value="">
                        </div>
                        <div class="info-send-text"><span>이메일로 예매 정보를 보내드립니다.</span></div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="userName" value="${user.userName}">
            <input type="hidden" name="userBirth" value="${user.birth}">
            <input type="hidden" name="userPhone" value="${user.phone}">
            <input type="hidden" name="userEmail" value="${user.email}">
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
                            <span class="my-reserve-time-value">
                                ${reserveDate}
                            </span>
                        </div>       
                    </div>  
                    <div class="my-reserve-info plus-css">
                        <div class="my-reserve-time">
                            <div><span>선택좌석</span></div>
                            <div class="my-seat">
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
                    <form class="next-form" action="selectPayment.co" method="POST">
                        <input type="hidden" name="concertNo" value="${concert.concertNo}">
                        <input type="hidden" name="recipientName">
                        <input type="hidden" name="recipientPhone">
                        <input type="hidden" name="recipientBirth">
                        <input type="hidden" name="recipientEmail">
                        <input type="hidden" name="seatList">
                        <input type="hidden" name="totalAmount" value="${totalAmount}">
                        <input type="hidden" name="reserveDate" value="${reserveDate}">
                        <input type="hidden" name="userNo" value="${user.userNo}">
                        <button class="next-step-area"  onclick="nextStep(this, event)" >
                            <span>다음단계</span>
                            <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                        </button>
                    </form>
              </div>
            </div>
         </div>
         <script src="${contextPath}/resources/js/api/concertReserveapi.js"></script>
         <script src="${contextPath}/resources/js/concert/concertReserveStepThree.js"></script>
	</div>
</body>
</html>