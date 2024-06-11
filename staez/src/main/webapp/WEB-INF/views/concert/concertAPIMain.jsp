<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>concert</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>concert</title>

    <!-- 슬라이더 css, script -->
    
    
    <!-- 적용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertMain.css">
</head>
<body>
    <div>
        <jsp:include page="../common/header.jsp" />
    </div>
    <!-- 공연 navi -->
    <div class="concert-navi-div">
        <ul class="concert-ul">
          <!-- 자스로 그려줌 -->
        </ul>
    </div>
    <input type="hidden" name="categoryNo" value="${cat.categoryNo}">

    <section class="concert-main-upper-section">

        <div class="concert-main-upper-before">
            <img src="${pageContext.request.contextPath}/resources/img/main/before.png">
        </div>
        <div class="concert-main-upper">
            
            <!-- 사진 다음으로 넘기는 버튼 -->

            <!-- 사진반복, 슬라이드 -->
            <!-- https://devinus.tistory.com/47
                https://m.blog.naver.com/ka28/221999891981
                https://www.inflearn.com/blogs/3749 -->
            <!-- <c:forEach var="co" items="${list }">
                <div class="concert-main-upper-pic-div" onclick="goDetail('${co.concertNo}')">
                    <img src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FClas%2F2404%2F240425024045_24005737.gif&w=384&q=75"
                        alt="">
                    <div class="concert-main-upper-sen-div">
                        <p><span><b><h2>${co.concertTitle}</h2></span></b></p>
                        <p><span>${co.theaterName}</span></p>
                        <p><span>${co.startDate} - ${co.endDate}</span></p>
                    </div>
                </div>
            </c:forEach> -->
<!--              
            <div class="concert-main-upper-pic-div" onclick="goDetail()">
                <img src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FClas%2F2404%2F240425024045_24005737.gif&w=384&q=75"
                    alt="">
                <div class="concert-main-upper-sen-div">
                    <p><span><b><h2>${list.size()}</h2></span></b></p>
                    <p><span>성남아트센터</span></p>
                    <p><span>2024.06.22 - 2024.06.23</span></p>
                </div>
            </div>

            </div> -->
        </div>
        <div class="concert-main-upper-next">
            <img src="${pageContext.request.contextPath}/resources/img/main/after.png">
        </div>
    </section>

    <section class="running-concert">
        <br><br>
        <h3>현재 진행중인&nbsp; <b id="concert-genre">${cat.categoryName}</b></h3>
        <br>
    </section>
    <hr class="concert-main-hr">

    <section class="concert-main-list-section">
        <ul class="concert-main-list-ul"> <!-- 전체보기 버튼이 클릭이 안돼서 return false 붙여줌 why? 이벤트 버블링 때문?? event.stopPropagation()?? -->
            <li><button class="concert-main-list-button" onclick="allListClick(); return false;"><h3><span>전체보기</span></h3></button></li>
            <li><button class="concert-main-list-button" onclick="popularClick()"><h3><span>인기순위</span></h3></button></li>
            <li><button class="concert-main-list-button" onclick="latestClick()"><h3><span>최신공연</span></h3></button></li>
            <li><button class="concert-main-list-button" onclick="highscoreClick()"><h3><span>별점높은</span></h3></button></li>
            <li id="concert-main-list-area-parent"><button class="concert-main-list-button area" onclick="locationClick()"><h3><span>지역전체 ▼</span></h3></button>
                <ul class="concert-main-list-area"> 
                    <li><a onclick="locationArea('서울')">서울</a></li>
                    <li><a onclick="locationArea('경기')">경기</a></li>
                    <li><a onclick="locationArea('강원')">강원</a></li>
                    <li><a onclick="locationArea('충청')">충청</a></li>
                    <li><a onclick="locationArea('전라')">전라</a></li>
                    <li><a onclick="locationArea('경상')">경상</a></li>
                    <li><a onclick="locationArea('제주')">제주</a></li>
                </ul>
            </li>
        </ul>
    </section>
    

    <section class="concert-main-grid-section">
        <div class="concert-main-grid">
            <!-- <div onclick="">
                </div>
                    <div>
                        <img src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FMusc%2F2404%2F240412030249_24005266.gif&w=384&q=75"
                            alt="">
                            <p><span>뮤지컬</span></p>
                            <p><span><b>[시카고]</b></span></p>
                            <p><span>2024.06.22 - 2024.06.23</span></p>
                    </div>
                </div> -->
            
        </div>
    </section>


    <div>
		<jsp:include page="../common/footer.jsp" />
	</div>
        <!-- 적용 자바스크립트 -->


    <script src="<c:url value='/resources/js/api/concertapi.js'/>"></script>
    <script src="<c:url value='/resources/js/concert/concertAPIMain.js'/>"></script>

    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>

</body>
</html>