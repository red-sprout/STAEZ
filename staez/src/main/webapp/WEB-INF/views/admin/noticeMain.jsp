<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/notice.css'/>">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/noticeMain.js'/>"></script>
	</header>
    <main>
        <ul id="notice-contents" align="left">
            <li id="notice-header">
                <h1>공지사항</h1>
                <select id="notice-select">
                    <option value="title">제목</option>
                    <option value="contents">내용</option>
                </select>
                <div id="notice-search">
                    <button>
                        <img src="<c:url value='/resources/img/admin/notice/search-icon.png'/>" alt="">
                    </button>
                    <input type="text" name="keyword" value="">
                </div>
            </li>
            <li id="notice-category">
                <div id="category-div"></div>
                <c:if test = "${loginUser.grade eq 1}">
                    <div>
                        <button class="btn-staez purple" onclick="location.href='insertForm.no'"><h3>작성</h3></button>
                    </div>
                </c:if>
            </li>
        </ul>
    </div>
    </main>
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>