<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>concert</title>

    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- 적용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertDetailMain.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertDetail.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/65a2de1a44.js" crossorigin="anonymous"></script>
    <!-- 달력 -->
    <script src="${pageContext.request.contextPath}/resources/js/concert/concertDetailCalendar.js"></script>
    <!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
    <!-- 적용 자바스크립트 -->
    <script src="<c:url value='/resources/js/concert/concertDetail.js'/>"></script>

</head>

<body>
    <div>
        <jsp:include page="../common/header.jsp" />
    </div>

    <!-- 공연 navi -->
    <div>
        <ul class="concert-ul">
            <li><a href="main.co?category=musical"><span><h2>뮤지컬</h2></span></a></li>
            <li><a href="main.co?category=classic"><span><h2>클래식</h2></span></a></li>
            <li><a href="main.co?category=kclassic"><span><h2>국악</h2></span></a></li>
            <li><a href="main.co?category=pop"><span><h2>대중음악</h2></span></a></li>
            <li><a href="main.co?category=play"><span><h2>연극</h2></span></a></li>
            <li><a href="main.co?category=circus"><span><h2>서커스/마술</h2></span></a></li>
            <li><a href="main.co?category=etc"><span><h2>기타</h2></span></a></li>
        </ul>
    </div>

    <!-- 공연상세페이지 위쪽(노란 블럭 안쪽) -->
    <section class="concert-detail-upper-section">
        <div class="concert-detail-upper-div concert-detail-body-div">
            <div>
                <img src="${pageContext.request.contextPath}/resources/img/concert/공연상세페이지임시.png" alt="">
            </div>
            <!-- 좋아요 버튼 -->
            <div class="concert-detail-like">
                <button class="concert-detail-like-button" onclick="likeToggle(this)">
                    <i class="fa-regular fa-heart"></i>
                    <input type="checkbox" class="hidden">
                    <!-- <i class="fa-solid fa-heart" style="color: #ff0000;"></i> -->
                    <span>127</span>
                </button>
                <div class="concert-detail-like-commu"><a href=""><span><b>천개의 파랑 커뮤니티로 가기</b></span></a></div>
            </div>
        </div>
        <div class="concert-detail-body-div">
            <table class="concert-detail-table">
                <tr>
                    <td><img id="concert-detail-starImg" src="${pageContext.request.contextPath}/resources/img/concert/tempStar.png" alt=""></td>
                </tr>
                <tr>                    
                    <td><h2>&lt;천개의 파랑&gt;</h2></td>
                <tr>
                <tr>                    
                    <td></td>
                <tr>
                    <td><b><span>공연기간&nbsp&nbsp</span></b><span>2024.05.12 ~ 2024.05.26</span></td>
                </tr>
                <tr>
                    <td><b><span>공연장소&nbsp&nbsp</span></b><span>예술의전당 CJ토월극장</span></td>
                </tr>
                <tr>
                    <td><b><span>공연시간&nbsp&nbsp</span></b><span>140분</span></td>
                </tr>
                <tr>
                    <td><b><span>관람연령&nbsp&nbsp</span></b><span>초등학생 이상</span></td>
                </tr>
                <tr>
                    <td><b><span>가격&nbsp&nbsp</span></b><span>R석 90,000원 | S석 60,000원 | A석 30,000원</span></td>
                    <!-- 가격을세로로 적고싶을 때 -->
                    <!-- <td colspan="2">
                        <table>
                            <tr>
                                <td><b><span>가격&nbsp&nbsp</span></b></td>
                                <td><span>R석 90,000원</span></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><span>S석 60,000원</span></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><span>A석 30,000원</span></td>
                            </tr>
                        </table>
                    </td> -->
                </tr>

                    <td><b><span>주최&nbsp&nbsp</span></b><span>서울예술단</span></td>
                </tr>
            </table>
        </div>
        
        <!-- 달력구현 -->
            <div class="concert-calendar-container">        
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
							<!-- 스크립트 이용해서 넣음 -->
						</ul>
					</div>
				</div>
                <button class="reservation-button" onclick="reservePage()"><span>예매하기</span></button>
            </div>
    </section>

        <!-- 공연상세페이지 아래쪽 navi-->
    <section class="concert-detail-down-section">
        <ul class="concert-down-ul">
            <li><a href="detail.co"><h3>공연상세정보</h3></a></li>
            <li><a href="sellInfo.co"><h3>판매정보</h3></a></li>
            <li><a href="comment.co"><h3>한줄평(35)</h3></a></li>
            <li><a href="detailReview.co"><h3>관람후기(10)</h3></a></li>
        </ul>
    </section>
    <hr class="concert-detail-hr">
    <br>
</body>
</html>