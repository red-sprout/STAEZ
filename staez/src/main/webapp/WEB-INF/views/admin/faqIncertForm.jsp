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
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="post" action="faqIncert.ad">
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
                <li id="faq-category" onload="init(3)">
                    <h3>카테고리</h3>
                    <!-- <button class="btn-staez checked" type="button" onclick="toggleCategory(this);">
                        <h4>공연</h4>
                    </button>
                    <input type="radio" name="categoryNo" class="hidden" id="">
                    <button class="btn-staez" type="button" onclick="toggleCategory(this);">
                        <h4>커뮤니티</h4>
                    </button>
                    <input type="radio" name="categoryNo" class="hidden" id="">
                    <button class="btn-staez" type="button" onclick="toggleCategory(this);">
                        <h4>예매</h4>
                    </button>
                    <input type="radio" name="categoryNo" class="hidden" id="">
                    <button class="btn-staez" type="button" onclick="toggleCategory(this);">
                        <h4>환불/취소</h4>
                    </button>
                    <input type="radio" name="categoryNo" class="hidden" id="">
                    <button class="btn-staez" type="button" onclick="toggleCategory(this);">
                        <h4>사이트 이용</h4>
                    </button>
                    <input type="radio" name="categoryNo" class="hidden" id="">
                    <button class="btn-staez" type="button" onclick="toggleCategory(this);">
                        <h4>티켓</h4>
                    </button>
                    <input type="radio" name="categoryNo" class="hidden" id=""> -->
                </li>
                <li>
                    <textarea name="boardContent" id="" rows="10" ></textarea>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="submit">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple">
                        <h3>목록</h3>
                    </button>
                </li>
                <script src="<c:url value='/resources/js/admin/faqIncertForm.js'/>"></script>
            </form>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>