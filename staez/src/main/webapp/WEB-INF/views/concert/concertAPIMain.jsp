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
   
    <!-- 적용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertMain.css">
</head>

<body>

    <div id="load">
        <!-- 로딩 페이지 -->
    </div>

    <div>
        <jsp:include page="../common/header.jsp" />
    </div>
        <!-- 공연 navi -->

    <div class="concert-navi-div">
        <ul class="concert-ul">
          <!-- 자스로 그려줌 -->
        </ul>
    </div>

    <section class="concert-main-upper-section">

        <div class="concert-main-upper-before">
            <img src="${pageContext.request.contextPath}/resources/img/main/before.png">
        </div>
        <div class="concert-main-upper">
            
            <!-- 사진 다음으로 넘기는 버튼 -->

            <!-- 사진반복, 슬라이드 -->

        </div>
        <div class="concert-main-upper-next">
            <img src="${pageContext.request.contextPath}/resources/img/main/after.png">
        </div>
    </section>

    <section class="running-concert">

    </section>
    <hr class="concert-main-hr">

    <section class="concert-main-list-section">
        <ul class="concert-main-list-ul"> <!-- 전체보기 버튼이 클릭이 안돼서 return false 붙여줌 why? 이벤트 버블링 때문?? event.stopPropagation()?? -->
            <li><button class="concert-main-list-button allListClick category-checked" onclick="allListClick(); return false;"><h3><span>전체보기</span></h3></button></li>
            <li><button class="concert-main-list-button popularClick" onclick="popularClick()"><h3><span>인기순위</span></h3></button></li>
            <li><button class="concert-main-list-button latestClick" onclick="latestClick()"><h3><span>최신공연</span></h3></button></li>
            <!-- <li id="concert-main-list-area-parent"><button class="concert-main-list-button area" onclick="locationClick()"><h3><span>지역전체 ▼</span></h3></button>
                <ul class="concert-main-list-area"> 
                    <li><a onclick="locationArea('서울')">서울</a></li>
                    <li><a onclick="locationArea('경기')">경기</a></li>
                    <li><a onclick="locationArea('강원')">강원</a></li>
                    <li><a onclick="locationArea('충청')">충청</a></li>
                    <li><a onclick="locationArea('전라')">전라</a></li>
                    <li><a onclick="locationArea('경상')">경상</a></li>
                    <li><a onclick="locationArea('제주')">제주</a></li>
                </ul>
            </li> -->
        </ul>
    </section>
    

    <section class="concert-main-grid-section">
        <div class="concert-main-grid">
            <!-- grid 부분 -->
        </div>
    </section>

    <br><br>
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