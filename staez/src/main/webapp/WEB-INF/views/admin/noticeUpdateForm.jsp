<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeIncertForm.css'/>">
<script src="<c:url value='/resources/js/admin/noticeIncertForm.js'/>"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left">
                <h1>공지사항</h1>
                <hr>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="" id="">
                </li>
                <li>
                    <h3>카테고리</h3>
                    <button class="btn-staez checked">
                        <h4>공연</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>커뮤니티</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>예매</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>환불/취소</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>사이트 이용</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>티켓</h4>
                    </button>
                </li>
                <li>
                    <div id="summernote"></div>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="submit">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple">
                        <h3>목록</h3>
                    </button>
                </li>
            </form>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>