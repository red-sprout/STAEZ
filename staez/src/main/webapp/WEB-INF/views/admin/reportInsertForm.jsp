<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/reportInsertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/reportInsertForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="POST" action="insert.bo">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <input type="hidden" name="refBoardNo">
                <input type="hidden" name="boardCode" value="5">
                <input type="hidden" name="boardLevel" value="3">
                <input type="hidden" name="url" value="reportList.ad">
                <h1>신고하기</h1>
                <hr>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="" id="question-title" value="" readonly>
                </li>
                <li>
                    <h3>신고자</h3>
                    <input type="text" name="" id="question-writer" class="writer" value="" readonly>
                </li>
                <li>
                    <h3>링크</h3>
                    <a id="ref-board-link">해당 게시글로 바로가기 &gt;</a>
                </li>
                <li>
                    <textarea name="" id="question-contents" rows="10" readonly></textarea>
                </li>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="boardTitle" id="answer-title">
                </li>
                <li>
                    <h3>답변자</h3>
                    <input type="text" name="userId" class="writer" value="abc123" readonly>
                </li>
                <li>
                    <textarea name="boardContent" id="answer-contents" rows="10"></textarea>
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