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
            <input type="hidden" name="theaterNo" value="${concert.theaterNo}">
            <input type="hidden" name="concertNo" value="${concert.concertNo}">
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
                        <div class="round-area hidden"><span>회차(관람시간)</span></div>
                        <div class="schedule-container">
                            <!-- <div class="round-time-area">
                                <span>14시 00분</span>
                            </div> -->
                            
                        </div>
                    </div>
                    <div class="seat-rating-choice-area">
                        <div class="remaining-seat-rating-area">
                            
                        </div>
                        <div class="remaining-seat-rating-info hidden">
                            <!-- <div class="rating-area">
                                <div class="rating-color"></div>
                                <span class="rating-name">R석</span>
                                <img class="divide" src="${contextPath}/resources/img/concert/divide.png" alt="">
                                <span class="seat-count">73석</span>
                            </div>
                            <div class="rating-area">
                                <div class="rating-color"></div>
                                <span class="rating-name">S석</span>
                                <img class="divide" src="${contextPath}/resources/img/concert/divide.png" alt="">
                                <span class="seat-count">73석</span>
                            </div>
                            <div class="rating-area">
                                <div class="rating-color"></div>
                                <span class="rating-name">A석</span>
                                <img class="divide" src="${contextPath}/resources/img/concert/divide.png" alt="">
                                <span class="seat-count">73석</span>
                            </div> -->
                        </div>
                    </div>
                </div>
                <div class="precautions-area">
                    <span>유의사항</span>
                    <p>&#183; 증빙이 필요한 할인 (장애인, 국가유공자, 싹틔우미/노블 회원, 학생 등)을 받은 경우, 해당자 본인이 직접 증빙 자료를 제시해야 하며 미지참시 할인받은 만큼 차액을 지불해</p>
                    <p>&nbsp; 야 합니다.</p>
                    <p>&#183; 예매 변경은 결제 건을 취소 후 재예매하는 절차이므로 환불과 동일한 수수료가 부과됩니다. (할인은 재예매 시점에 적용되는 할인율로만 적용 가능합니다.)</p>
                    <p>&#183; 취소수수료와 취소 가능 일자는 상품별로 다르니, 오른쪽 하단 My예매정보를 확인해주시기 바랍니다.</p>
                    <p>&#183; ATM 기기에서 가상 계좌 입금이 안 될 수 있으니, 무통장 입금 외 다른 결제수단을 선택해주세요.</p>
                    <p>&#183; 8세 이상 공연장 입장 가능합니다. (공연 별 입장 연령 확인)</p>
                    <p>&#183; 승용차 이용 시 전당 주변의 교통체증과 주차장 혼잡으로 정시입장이 어려울 수 있습니다. 가급적 대중교통을 이용해주시기 바랍니다. 주차장 혼잡 및 입차 불가로 인한 지연</p>
                    <p>&nbsp; 입장, 티켓환불 불가합니다.</p>
                    <p>&#183; 조세특례제한법 제126조2에 따른 도서·공연비 소득공제 적용으로 예술의전당 공연 예매 시 신용카드 등 사용금액에 대해 추가 소득공제를 받으실 수 있습니다. (2018.7.1 시</p>
                    <p>&nbsp; 행, 관련 세부사항은 별도 확인)</p>
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
                            <span class="my-reserve-time-value">
                               
                            </span>
                        </div>       
                    </div>  
                </div>
                <div class="total-payment-amount-area">
                    <span>총 결제금액</span>
                    <div>
                        <span id="amount">0</span>
                        <span>원</span>
                    </div>
                </div>
                <form class="next-step-container hidden" action="selectSeat.co" method="POST">
                    <input type="hidden" name="concertNo" value="${concert.concertNo}">
                    <input type="hidden" name="reserveDate" value="">
                    <input type="hidden" name="userNo" value="${userNo}">
                    <div class="next-step-area">
                        <button type="submit">다음단계</button>
                        <img src="${contextPath}/resources/img/concert/nextArrow.png" alt=""> 
                    </div>
                </form>
            </div>
        </div>
        <script src="${contextPath}/resources/js/api/concertReserveapi.js"></script>
        <script src="${contextPath}/resources/js/concert/concertReserveStepOne.js"></script>
    </div>
</body>
</html>