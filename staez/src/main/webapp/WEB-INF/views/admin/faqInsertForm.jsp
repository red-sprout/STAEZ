<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/faqIncertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/faqInsertForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="post" action="faqInsert.ad">
                <h1>FAQ</h1>
                <hr>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="boardTitle" id="title">
                </li>
                <li>
                    <h3>작성자</h3>
                    <input type="text" name="userId" id="writer" value="${loginUser.userId}" readonly>
                    <input type="hidden" name="userNo" id="" value="${loginUser.userNo}">
                    <input type="hidden" name="boardCode" id="" value="4">
                </li>
                <li id="faq-category">
                    <h3>카테고리</h3>
                </li>
                <li>
                    <textarea name="boardContent" rows="10" ></textarea>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="button" onclick="faqSubmit()">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple" type="button" onclick="location.href='faqList.ad'">
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