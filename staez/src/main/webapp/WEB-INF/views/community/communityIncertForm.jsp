<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/community/communityIncertForm.css'/>">
<script src="<c:url value='/resources/js/community/communityIncertForm.js'/>"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div id="community-wrapper">
            <ul id="community-nav" align="left">
                <li onclick="">
                    <h2 class="selected">커뮤니티 메인</h2>
                </li>
                <li onclick="">
                    <h2>입문 가이드</h2>
                </li>
                <li onclick="">
                    <h2>질문과 답변</h2>
                </li>
                <li onclick="">
                    <h2>리뷰</h2>
                </li>
                <li onclick="">
                    <h2>자유게시판</h2>
                </li>
                <li id="write-btn" onclick="location.href='incertForm.co'">
                    <h2>글쓰기</h2>
                    <img src="<c:url value='/resources/img/community/communityMain/write.png'/>" alt="">
                </li>
            </ul>
            <form id="community-contents"  align="left">
                <li>
                    <h3>제목</h3>
                    <input type="text" name="" id="">
                </li>
                <li>
                    <h3>장르</h3>
					<button class="btn-staez checked"><h4>뮤지컬</h4></button>
					<button class="btn-staez"><h4>클래식</h4></button>
					<button class="btn-staez"><h4>국악</h4></button>
					<button class="btn-staez"><h4>대중음악</h4></button>
					<button class="btn-staez"><h4>연극</h4></button>
					<button class="btn-staez"><h4>서커스/마술</h4></button>
					<button class="btn-staez"><h4>기타</h4></button>
                </li>
                <li>
                    <h3>구분</h3>
					<button class="btn-staez checked"><h4>입문 가이드</h4></button>
					<button class="btn-staez"><h4>질문과 답변</h4></button>
					<button class="btn-staez"><h4>리뷰</h4></button>
					<button class="btn-staez"><h4>자유게시판</h4></button>
                </li>
                <li>
                    <h3>태그</h3>
                    <div id="community-search">
                        <button>
                            <img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
                        </button>
                        <input type="text" name="" id="">
                    </div>
                </li>
                <li>
                    <div id="summernote"></div>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="submit"><h3>작성</h3></button>
                    <button class="btn-staez purple" ><h3>목록</h3></button>
                </li>
            </form>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>