<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/community/communityInsertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/communityapi.js'/>"></script>
        <script src="<c:url value='/resources/js/community/communityInsertForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <!-- <jsp:include page="/WEB-INF/views/community/communityNav.jsp" /> -->
            <form id="community-contents" align="left" method="post">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <li>
                    <h3>제목</h3>
                    <input type="text" name="boardTitle">
                </li>
                <li id="community-genre">
                    <h3>장르</h3>
                </li>
                <li id="community-div">
                    <h3>구분</h3>
                </li>
                <li id="community-tag">
                    <h3>태그</h3>
                    <div id="community-search">
                        <button type="button">
                            <img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
                        </button>
                        <input type="text" name="concertTitle" onkeydown="searchResult(this)" onkeyup="searchResult(this)">
                        <input type="hidden" name="concertNo" value="0">
                    </div>
                    <ul class="search-list">
                    </ul>
                </li>
                <li>
                    <div id="summernote"></div>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="button"><h3>작성</h3></button>
                    <button class="btn-staez purple" type="button" onclick="location.href='main.cm'"><h3>목록</h3></button>
                </li>
            </form>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>