<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<body>
    <c:if test="${not empty alertMsg}">
        <script>
            alert("${alertMsg}");
        </script>
        <c:remove var="alertMsg" />
    </c:if>
    <div align="center">
        <div class="header">
            <div class="header-top">
                <div id="header-top-flex">
                    <div class="header-logo-area">
                        <a href="${contextPath}"><img id="header-logo-img" src="${contextPath}/resources/img/common/header/STAEZ_logo.png" alt=""></a>
                    </div>
                    <div class="header-search-area">
                        <button onclick="">
                            <img src="${contextPath}/resources/img/common/header/search.png" alt="">
                        </button>
                        <input type="text">
                    </div>
                </div>
                <c:choose>
	                <c:when test="${empty loginUser}">
		                <div class="header-other-area">
		                    <a href="loginForm.me"><span id="login">로그인</span></a>
		                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">
		                    <a href="insertForm.me"><span id="join-membership">회원가입</span></a>
		                </div>
	                </c:when>
	                <c:otherwise>
		                <div class="header-other-area">
		                    <a href="scrapList.me"><img id="header-like-img" class="other-img" src="${contextPath}/resources/img/common/header/heart-header.png" alt=""></a>
		                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">
		
		                    <a href="calendar.co"><img id="header-calendar-img" class="other-img" src="${contextPath}/resources/img/common/header/calendar.png" alt=""></a>
		                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">
		
		                    <a href="main.me"><img id="profile-img" class="other-img" src="${contextPath}/resources/img/common/header/profile.png" alt=""></a>
		                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">
		
		                    <a href="logout.me"><span id="logout">로그아웃</span></a>
		                </div>
	                </c:otherwise>
                </c:choose>
            </div>
            <div class="header-menu">
                <!--일반 회원-->
                <div class="menu-bar-area">
                    <div class="menu-bar">
                        <a href="main.co"><span>공연</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href="main.cm"><span>커뮤니티</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href="main.no"><span>공지사항</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href="main.iq"><span>고객센터</span></a>
                    </div>
                </div>
                <!--관리자-->
                <!-- <div class="menu-bar-area">
                    <div class="menu-bar">
                        <a href=""><span>공연</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href=""><span>커뮤니티</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href=""><span>공지사항</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href=""><span>고객센터</span></a>
                    </div>
                    <div class="menu-bar">
                        <a href=""><span>관리자 페이지</span></a>
                    </div>
                </div> -->
                <div class="menu-bar-small">
                    <div class="menu-bar">
                        <a href=""><span>메뉴</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr class="line">
</body>
</html>