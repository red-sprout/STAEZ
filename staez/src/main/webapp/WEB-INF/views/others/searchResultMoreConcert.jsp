<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/others/searchResultMoreConcert.css">
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
        </div>
        <div class="concert-search-result-area">
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
            <div class="concert-search-result-info">
                <a href=""><img src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                <div class="concert-search-result-content-info">
                    <span class="concert-search-result-content-span1">뮤지컬</span>
                    <span class="concert-search-result-content-span2">[시카고]</span>
                    <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                </div>
            </div>
        </div>

        <hr class="gap-hr">

    </main>
    <footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>

</body>
</html>