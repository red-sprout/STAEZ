<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/others/reserveMain.css">
<title>Insert title here</title>
</head>
<body>
    <header>
        <jsp:include page="../common/header.jsp" />
        <script src="${contextPath}/resources/js/api/othersapi.js"></script>
        <script src="${contextPath}/resources/js/others/reserveMain.js"></script>
    </header>
    <div id="main-advertisement-area">
        <img id="main-advertisement" src="${contextPath}/resources/img/others/mainAdvertisement.png" alt="">
    </div>
    <main>
        <input type="hidden" value="${loginUser.userNo}" name="userNo">
        <div class="popularity-concert-container">
            <div class="popularity-concert-head">
                <div class="popularity-concert-category-area">
                    <span>인기공연</span>
                    <select name="categoryNo" id="popularity-concert-category-box">
                       
                    </select>
                </div>
                <div class="paging-area-container">
                    <div id="paging-area">
                        <a href="" id="paging-tag">
                            <span>더보기 +</span>
                        </a>
                    </div>
                </div> 
            </div>
            <div class="popularity-concert-information-area">
                <div class="popularity-concert-information-slider">
                    <!-- <div class="popularity-concert-information">
                        <a class="popularity-concert-information-a" href="${contextPath}/detail.co"><img class="popularity-concert-information-img" src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                        <div class="concert-search-result-content-info">
                            <span class="concert-search-result-content-span1">뮤지컬</span>
                            <span class="concert-search-result-content-span2">[시카고]</span>
                            <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                        </div>
                    </div> -->
                </div>
                <button class="slider-btn left-btn" onclick="slideLeft1()"><img src="${contextPath}/resources/img/others/leftSliderBTN.png" alt=""></button>
                <button class="slider-btn right-btn" onclick="slideRight1()"><img src="${contextPath}/resources/img/others/rightSliderBTN.png" alt=""></button>
            </div>
        </div>
        <div class="latest-concert-container">
            <div class="latest-concert-head">
                <div class="latest-concert-category-area">
                    <span>최신공연</span>
                    <select name="categoryNo" id="latest-concert-category-box">
                        
                    </select>
                </div>
                <div class="paging-area-container">
                    <div id="paging-area">
                        <a href="" id="paging-tag">
                            <span>더보기 +</span>
                        </a>
                    </div>
                </div> 
            </div>
            <div class="latest-concert-information-area">
                <div class="latest-concert-information-slider">
                    <!-- <div class="latest-concert-information">
                        <a class="latest-concert-information-a" href="${contextPath}/detail.co"><img class="latest-concert-information-img" src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                        <div class="concert-search-result-content-info">
                            <span class="concert-search-result-content-span1">뮤지컬</span>
                            <span class="concert-search-result-content-span2">[시카고]</span>
                            <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                        </div>
                    </div> -->
                </div>
                <button class="slider-btn left-btn" onclick="slideLeft2()"><img src="${contextPath}/resources/img/others/leftSliderBTN.png" alt=""></button>
                <button class="slider-btn right-btn" onclick="slideRight2()"><img src="${contextPath}/resources/img/others/rightSliderBTN.png" alt=""></button>
            </div>
        </div>
        <div class="popularity-bulletin-container">
            <div class="popularity-bulletin-head">
                <div class="popularity-bulletin-title-area">
                    <span>인기 게시글</span>
                </div>
                <div class="paging-area-container">
                    <div id="paging-area">
                        <a href="" id="paging-tag">
                            <span>더보기 +</span>
                        </a>
                    </div>
                </div> 
            </div>
            <div class="popularity-bulletin-information-area">
                <!-- <div class="popularity-bulletin-information">
                    <div class="popularity-bulletin-information-a" onclick="location.href='detail.cm'">
                        <div class="popularity-bulletin-content-area">
                            <div class="popularity-bulletin-title">
                                <span>시카고 후기 쓴다</span>
                            </div>
                            <hr class="popularity-bulletin-hr">
                            <div class="popularity-bulletin-detail-content">
                                <p>묵찌빠로 유학다녀오신<br>
                                분이 시카고에서도 활동<br>
                                하시는거보고 깜짝 놀랐<br>
                                어요</p>
                                <div class="heart-count-area" onclick="changeLike(this, event)">
                                    <img class="heart" src="${contextPath}/resources/img/others/like-no.png" alt="">
                                    <span class="heart-count">27</span>
                                </div>
                            </div>
                        </div>
                        <div class="user-and-category-tag-area">
                            <div class="user-profile"><img src="${contextPath}/resources/img/others/userProfile1.png" alt=""></div>
                            <button class="btn-staez checked " style="padding: 0px 10px"><h5>뮤지컬</h5></button>
                            <button class="btn-staez checked " style="padding: 0px 10px"><h5>리뷰</h5></button>
                        </div>  
                    </div>
                </div> -->
    
            </div>
        </div>
    </main>
    <c:if test="${not empty loginUser}">
        <jsp:include page="../chatbot/chatbot.jsp" />
    </c:if>
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>