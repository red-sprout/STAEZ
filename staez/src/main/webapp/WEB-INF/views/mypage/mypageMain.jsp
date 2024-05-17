<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageMain.css">
<title>Insert title here</title>
</head>

<body onload="init()">
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
                    <div id="profile-image">
                        <img src="${pageContext.request.contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                    </div>
                    <div id="profile-text">
                        <span>00님</span><br>
                        <span>환영합니다</span>
                    </div>
                </div>
                <div class="side-menu">
                    <ul>
                        <li class="small-title">마이페이지</li>
                        <li><a href="#">결제내역</a></li>
                        <li><a href="#">찜목록</a></li>
                        <li><a href="#">한줄평</a></li>
                        <li>커뮤니티 관리</li>
                        <li><a href="#">나의 게시글</a></li>
                        <li><a href="#">좋아요</a></li>
                        <li>설정</li>
                        <li><a href="#">회원정보 변경</a></li>
                        <li><a href="#">1:1 문의 내역</a></li>
                        
                    </ul>
                </div>
            </div>
            <div class="main-content">
                
            </div>
        
        </div>

	</main>
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>