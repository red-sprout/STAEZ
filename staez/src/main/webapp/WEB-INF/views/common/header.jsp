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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div align="center">
        <div class="header">
            <div class="header-top">
                <div class="header-logo-area">
                    <a href=""><img id="header-logo-img" src="${contextPath}/resources/img/common/header/STAEZ_logo.png" alt=""></a>
                </div>
                <div class="header-search-area">
                    <button onclick="">
                        <img src="${contextPath}/resources/img/common/header/search.png" alt="">
                    </button>
                    <input type="text">
                </div>

                <!--로그인 X-->

                <div class="header-other-area">
                        <a href=""><span id="login">로그인</span></a>
                        <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">
                        <a href=""><span id="join-membership">회원가입</span></a>
                </div>


                <!--로그인 O-->

                <!-- <div class="header-other-area">
                    <a href=""><img id="header-like-img" class="other-img" src="${contextPath}/resources/img/common/header/heart-header.png" alt=""></a>
                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">

                    <a href=""><img id="header-calendar-img" class="other-img" src="${contextPath}/resources/img/common/header/calendar.png" alt=""></a>
                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">

                    <a href=""><img id="profile-img" class="other-img" src="${contextPath}/resources/img/common/header/profile.png" alt=""></a>
                    <img class="stick" src="${contextPath}/resources/img/common/header/divide.png" alt="">

                    <a href=""><span id="logout">로그아웃</span></a>
                </div>    -->
            </div>
            <div class="header-menu">
                <!--일반 회원-->
                <div class="menu-bar-area">
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

            </div>
     </div>
    </div>
    <hr class="line">
</body>
</html>