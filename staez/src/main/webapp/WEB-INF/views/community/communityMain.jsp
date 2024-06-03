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
					<input type="text" name="keyword">
				</li>
				<li id="community-category"></li>
				<!-- <li id="community-pagination">
					<div class="page-list">
						<div class="pagination">
							<img src="<c:url value='/resources/img/main/before.png'/>">
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
							<img src="<c:url value='/resources/img/main/after.png'/>">
						</div>
					</div>
				</li> -->
			</ul>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>