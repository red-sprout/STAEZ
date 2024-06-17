<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
    
</head>
<body>
    <input type="hidden" name="userNo" value="${loginUser.userNo}">
    <input type="hidden" name="concertId" value="${conapi.originName}">
    <input type="hidden" name="concertNo" value="${conapi.concertNo}">

    <div>
        <jsp:include page="../common/header.jsp" />

        <!-- 적용 자바스크립트 -->

    </div>

    <!-- 공연 navi -->
    <div class="concert-navi-div">
        <ul class="concert-ul">
          <!-- 자스로 그려줌 -->
        </ul>
    </div>


    <input type="hidden" name="filePath" value="${conapi.filePath}">
    <input type="hidden" name="startDate" value="${conapi.startDate}">
    <input type="hidden" name="endDate" value="${conapi.endDate}">
    <input type="hidden" name="theaterName" value="${conapi.theaterName}">


    
    <!-- 공연상세페이지 위쪽(노란 블럭 안쪽) -->
    <section class="concert-detail-upper-section">
        <div class="concert-detail-upper-div concert-detail-body-div">
            <div class="concert-detail-pic">
                <!-- 악 수정하고싶어 -->
                <img src="${conapi.filePath}" alt="">
            </div>
            <!-- 좋아요 버튼 -->
            <div class="concert-detail-like">
                <button class="concert-detail-like-button" onclick="likeToggle(this)">
                    <i class="fa-regular fa-heart"></i>
                    <span class="concert-likeCount"></span>
                </button> <!-- 길이조절필요 -->
                <div class="concert-detail-like-commu"><a href="main.cm"><span><b>${conapi.concertTitle}<br>커뮤니티로 가기</b></span></a></div>
            </div>
        </div>
        <div class="concert-detail-body-div">
            <table class="concert-detail-table">
                <tr>
                    <td>
                        <c:forEach var="i" begin="1" end="${com[0].score}"> <!-- 배열 길이만큼 나눠서 avg 만들고, round 처리 필요-->
                            <img id="concert-detail-starImg" src="${pageContext.request.contextPath}/resources/img/concert/star.png" alt="">
                        </c:forEach>
                    </td>
                </tr>
                <tr>                    
                    <td><h2>&lt;${conapi.concertTitle}&gt;</h2></td>
                <tr>
                <tr>                    
                    <td></td>
                <tr>
                    <td><b><span>공연기간&nbsp&nbsp</span></b>
                        <span id="conStartDate">${conapi.startDate}</span> ~ <span id="conEndDate">${conapi.endDate}</span></td>
                </tr>
                <tr>
                    <td><b><span>공연장소&nbsp&nbsp</span></b><span>${conapi.theaterName}</span></td>
                </tr>
                <tr>
                    <td><b><span>공연시간&nbsp&nbsp</span></b><span>${conapi.concertPlot}</span></td>
                </tr>
                <tr>
                    <td><b><span>관람연령&nbsp&nbsp</span></b><span>${conapi.ageLimit}</span></td>
                </tr>
                <tr><!-- 가격??? -->
                    <td><b><span>가격&nbsp&nbsp</span></b><span>
                        ${conapi.path}
                    </span></td>
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
                <c:if test="${not empty conapi.concertProduction}">
                </tr>
                    <td><b><span>주최&nbsp&nbsp</span></b><span>${conapi.concertProduction}</span></td>
                </tr>
                </c:if>
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

        <ul class="concert-down-ul">
            <li onclick="goConDetail()" class="conDetail1"><a><h3>공연상세정보</h3></a></li>
            <li onclick="goSellDetail()" class="conDetail2"><a><h3>판매정보</h3></a></li>
            <li onclick="goCommentDetail()" class="conDetail3"><a><h3>한줄평()</h3></a></li>
            <li onclick="goReviewDetail()" class="conDetail4"><a><h3>관람후기()</h3></a></li>
        </ul>
        <hr class="concert-detail-hr">
        <br>

    <section class="concert-detail-down-section">

        <!-- <div>
            <div class="concert-detail-subject">
                <br>
                <span><h2>작품소개</h2></span>
                <div>
                    ${fn:replace(con.concertPlot, replaceChar, "<br/>")}
                </div>
            </div>
            <br><br>
            <div class="concert-detail-subject">
                <span><h2>공지사항</h2></span>
                <img src="${pageContext.request.contextPath}${con.filePath}${con.changeName}" alt="">
            </div>
            <br><br>
        </div> -->

    </section>

    <div class="page-list" align="center">
        <!-- 자스 -->
    </div>


    <br>

    <div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    <script src="<c:url value='/resources/js/api/concertapi.js'/>"></script>
    <script src="<c:url value='/resources/js/concert/concertAPIDetailMain.js'/>"></script>
</body>
</html>