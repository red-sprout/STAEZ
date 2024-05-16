<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<title>Insert title here</title>
</head>
<body onload="init()">
	<header>
		<jsp:include page="common/header.jsp" />
	</header>
	<main>
		<!-- 아래에는 여러분들의 html/css 실력을 자랑해주세요! -->
        <h1>&lt;h1&gt; - 대분류, 해당 페이지의 헤더 푸터 제외 가장 큰 글자에 적용</h1>
        <h1>간격 테스트</h1>
        <h2>&lt;h2&gt; - 중분류, 대분류의 하위 항목, 보통 2~3개 정도 나올 것 같음</h2>
        <h2>간격 테스트</h2>
        <h3>&lt;h3&gt; - 제목, 공연이나 커뮤니티 글 제목, 큰 버튼</h3>
        <h3>간격 테스트</h3>
        <h4>&lt;h4&gt; - 작은 버튼</h4>
        <h4>간격 테스트</h4>
        <h5>&lt;h5&gt; - 필요시 사용(거의 없을 예정)</h5>
        <h5>간격 테스트</h5>
        줄글 및 본문은 따로 태그 X
    
        <h1>버튼(카테고리)</h1>
        <h2>일반 버튼</h2>
        <button class="btn-staez checked"><h3>공연</h3></button>
        <button class="btn-staez"><h3>공연</h3></button>
        <button class="btn-staez purple"><h3>공연</h3></button>
        <h2>작은 버튼</h2>
        <button class="btn-staez checked "><h4>공연</h4></button>
        <button class="btn-staez"><h4>공연</h4></button>
        <button class="btn-staez purple"><h4>공연</h4></button>
    
        <br><br>
        <h1>RGB</h1>
        <div style="display: flex;">
            <div style="display: flex; justify-content: center; align-items: center; background-color: #640D6B; width: 100px; height: 100px;">
                <h2 style="color: white;">#640D6B</h2>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; background-color: #B51B75; width: 100px; height: 100px;">
                <h2 style="color: white;">#B51B75</h2>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; background-color: #E65C19; width: 100px; height: 100px;">
                <h2>#E65C19</h2>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; background-color: #F8D082; width: 100px; height: 100px;">
                <h2>#F8D082</h2>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; background-color: #969696; width: 100px; height: 100px;">
                <h2>#969696</h2>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; background-color: #D9D9D9; width: 100px; height: 100px;">
                <h2>#D9D9D9</h2>
            </div>
        </div>
    
        <br><br>
        <h1>Pagination</h1>
        <div class="page-list">
            <div class="pagination">
                <img src="${contextPath}/resources/img/main/before.png">
            </div>
            <div class="pagination current"><h4>1</h4></div>
            <div class="pagination"><h4>2</h4></div>
            <div class="pagination"><h4>3</h4></div>
            <div class="pagination"><h4>4</h4></div>
            <div class="pagination"><h4>5</h4></div>
            <div class="pagination"><h4>6</h4></div>
            <div class="pagination"><h4>7</h4></div>
            <div class="pagination"><h4>8</h4></div>
            <div class="pagination"><h4>9</h4></div>
            <div class="pagination"><h4>10</h4></div>
            <div class="pagination">
                <img src="${contextPath}/resources/img/main/after.png">
            </div>
        </div>
	</main>
	<footer>
		<jsp:include page="common/footer.jsp" />
	</footer>
</body>
</html>