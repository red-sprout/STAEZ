<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/community/communityMain.css'/>">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<script src="<c:url value='/resources/js/api/communityapi.js'/>"></script>
		<script src="<c:url value='/resources/js/community/communityMain.js'/>"></script>
	</header>
	<main>
		<div id="community-wrapper">
			<ul id="community-nav" align="left"></ul>
			<ul id="community-contents" align="left">
				<li id="community-search">
					<button>
						<img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
					</button>
					<input type="text" name="keyword" value="">
				</li>
				<li id="community-category"></li>
			</ul>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>