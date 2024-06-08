<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/inquireInsertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/inquireInsertForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="POST" action="insert.bo">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <input type="hidden" name="refBoardNo">
                <input type="hidden" name="boardCode" value="3">
                <input type="hidden" name="url" value="inquireList.ad">
                <h1>문의하기</h1>
                <hr>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="" id="question-title" readonly>
                </li>
                <li>
                    <h3>문의자</h3>
                    <input type="text" name="" id="question-writer" class="writer" readonly>
                </li>
                <li id="inquire-category"></li>
                <li>
                    <textarea name="" id="question-contents" rows="10" readonly></textarea>
                </li>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="boardTitle" id="answer-title">
                </li>
                <li>
                    <h3>답변자</h3>
                    <input type="text" name="userId" class="writer" value="${loginUser.userId}" readonly>
                </li>
                <li>
                    <textarea name="boardContent" id="answer-contents" rows="10"></textarea>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="submit">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple" onclick="history.back()">
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