<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/others/searchResultPage.css">
<title>Insert title here</title>
</head>
<body>
	<header>
        <jsp:include page="../common/header.jsp" />
    </header>
    <main>
        <div class="search-result-value-area">
            <span>"시카고"검색결과</span>
        </div>
        <div class="concert-search-result-title-area">
            <span>공연정보(7)</span>
            <div class="paging-area-container">
                <div id="paging-area">
                    <a onclick="location.href='searchResult.co'" id="paging-tag">
                        <span>더보기 +</span>
                    </a>
                </div>
            </div> 
        </div>
        <div class="concert-search-result-area">
            <div class="concert-search-result-info">
                <a href="${contextPath}/detail.co"><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href="${contextPath}/detail.co"><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href="${contextPath}/detail.co"><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href="${contextPath}/detail.co"><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href="${contextPath}/detail.co"><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
        </div>
        <div class="concert-search-result-title-area">
            <span>커뮤니티(56)</span>
            <div class="paging-area-container">
                <div id="paging-area">
                    <a href="" id="paging-tag">
                        <span>더보기 +</span>
                    </a>
                </div>
            </div> 
        </div>
        <hr class="hr-line">
        <a onclick="location.href='detail.cm'" class="community-bulletin-search-result-a-area">
            <div class="community-bulletin-search-result-area">
                <div class="user-profile-area">
                    <img class="user-profile-img" src="" alt="">
                    <div class="user-info-area">
                        <span class="user-name">뮤덕이</span>
                        <span class="user-bulletin-upload-date">2024-05-01 00:00</span>
                    </div>
                </div>
                <div class="bulletin-content-area">
                        <span class="bulletin-content-title">웃는남자 같이 보실 분 있나요?</span>
                        <span class="bulletin-detail-content">제목이 곧 내용입니다.</span>
                </div>
                <div class="bulletin-content-tag-area">
                    <button class="btn-staez checked "><h4>뮤지컬</h4></button>
                    <button class="btn-staez  "><h4>질문과 답변</h4></button>
                </div>
            </div>
            <div class="bulletin-thumbnail-area">
                <img class="bulletin-thumbnail" src="" alt="">
            </div>
        </a>
        <hr class="hr-line">
        <a onclick="location.href='detail.cm'" class="community-bulletin-search-result-a-area">
            <div class="community-bulletin-search-result-area">
                <div class="user-profile-area">
                    <img class="user-profile-img" src="" alt="">
                    <div class="user-info-area">
                        <span class="user-name">뮤덕이</span>
                        <span class="user-bulletin-upload-date">2024-05-01 00:00</span>
                    </div>
                </div>
                <div class="bulletin-content-area">
                        <span class="bulletin-content-title">웃는남자 같이 보실 분 있나요?</span>
                        <span class="bulletin-detail-content">제목이 곧 내용입니다.</span>
                </div>
                <div class="bulletin-content-tag-area">
                    <button class="btn-staez checked "><h4>뮤지컬</h4></button>
                    <button class="btn-staez  "><h4>질문과 답변</h4></button>
                </div>
            </div>
            <div class="bulletin-thumbnail-area">
                <img class="bulletin-thumbnail" src="" alt="">
            </div>
        </a>
        <hr class="hr-line">
        <a onclick="location.href='detail.cm'" class="community-bulletin-search-result-a-area">
            <div class="community-bulletin-search-result-area">
                <div class="user-profile-area">
                    <img class="user-profile-img" src="" alt="">
                    <div class="user-info-area">
                        <span class="user-name">뮤덕이</span>
                        <span class="user-bulletin-upload-date">2024-05-01 00:00</span>
                    </div>
                </div>
                <div class="bulletin-content-area">
                        <span class="bulletin-content-title">웃는남자 같이 보실 분 있나요?</span>
                        <span class="bulletin-detail-content">제목이 곧 내용입니다.</span>
                </div>
                <div class="bulletin-content-tag-area">
                    <button class="btn-staez checked "><h4>뮤지컬</h4></button>
                    <button class="btn-staez  "><h4>질문과 답변</h4></button>
                </div>
            </div>
            <div class="bulletin-thumbnail-area">
                <img class="bulletin-thumbnail" src="${contextPath}/resources/img/others/thumbnail1.png" alt="">
            </div>
        </a>
        <hr class="hr-line">

        <hr class="gap-hr">
    </main>
    <footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>

</body>
</html>