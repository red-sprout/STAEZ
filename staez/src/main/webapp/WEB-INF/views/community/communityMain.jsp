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
				<c:forEach var="b" items="${boardList}">
					<li class="community-posting" onclick="location.href='detail.cm'">
						<table>
							<tbody>
								<tr class="profile-area">
									<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
									<td><h4>${b.nickname}</h4></td>
									<td rowspan="5">
										<input type="hidden" name="${b.boardNo}" class="boardNo">
										<input type="hidden" name="${b.userNo}" class="userNo">
									</td>
								</tr>
								<tr>
									<td>${b.boardWriteDate}</td>
								</tr>
								<tr>
									<td colspan="2"><h3>${b.boardTitle}</h3></td>
								</tr>
								<tr>
									<td colspan="2">${b.boardContent}</td>
								</tr>
								<tr>
									<td colspan="2">
										<button class="btn-staez checked"><h4>뮤지컬</h4></button>
										<button class="btn-staez"><h4>리뷰</h4></button>
									</td>
								</tr>
							</tbody>
						</table>
					</li>
				</c:forEach>
				<li id="community-pagination">
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
				</li>
			</ul>
		</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>