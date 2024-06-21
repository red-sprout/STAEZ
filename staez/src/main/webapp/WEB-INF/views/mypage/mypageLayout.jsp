<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageLayout.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/api/mypageapi.js"></script>
<script src="${contextPath}/resources/js/mypage/mypageLayout.js"></script>

<title>Insert title here</title>
</head>

<body onload="init()">
    <input type="hidden" id="contextPath" value="${contextPath}">
	<header>
		<jsp:include page="../common/header.jsp" />
	</header>
	<main>
        <div class="title">
            마이페이지
        </div>

        <div class="main-section">
            <div class="side">
                <div class="profile">
                    <c:choose>
	            	    <c:when test="${empty loginUser}">
                            <span>로그인 해주세요</span>
                        </c:when>
                        <c:otherwise>
                            <img src="" alt="">
                            <div id="profile-text">
                                <span><strong>${loginUser.nickname}</strong></span>
                                <span>님</span><br>
                                <span>환영합니다</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="side-menu">
                    <div class="small-title">마이페이지</div>
                    <ul>
                        <li><a id="paymentsLog" href="${contextPath}/paymentList.me?cpage=1">예매내역</a></li>
                        <li><a id="myScrapList" href="${contextPath}/scrapList.me?cpage=1">찜목록</a></li>
                        <li><a id="oneLineReview" href="${contextPath}/reviewList.me?cpage=1">한줄평</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">커뮤니티 관리</li>
                        <li><a id="myBoardList" href="${contextPath}/boardList.me?cpage=1">나의 게시글</a></li>
                        <li><a id="likeBoardList" href="${contextPath}/likeList.me?cpage=1">좋아요</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">설정</li>
                        <li><a id="updateUserForm" href="${contextPath}/updateForm.me">회원정보 변경</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">문의</li>
                        <li><a id="myInquireList" href="${contextPath}/inquireList.me?cpage=1">1:1 문의 내역</a></li>
                    </ul>
                        
                </div>
            </div>
            <input type="hidden" value="${contentPage}">
            <c:import url="${contentPage}.jsp" />
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