<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/inquireIncertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="POST" action="">
                <h1>문의하기</h1>
                <hr>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="" id="question-title" value="제목입니다." readonly>
                </li>
                <li>
                    <h3>문의자</h3>
                    <input type="text" name="" class="writer" value="abc123" readonly>
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
                    <textarea name="" id="question-contents" rows="10" readonly>내용입니다.</textarea>
                </li>
                <li>
                    <h3>제목</h3>
                    <input type="text" name="" id="answer-title">
                </li>
                <li>
                    <h3>답변자</h3>
                    <input type="text" name="" class="writer" value="abc123" readonly>
                </li>
                <li>
                    <textarea name="" id="answer-contents" rows="10"></textarea>
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