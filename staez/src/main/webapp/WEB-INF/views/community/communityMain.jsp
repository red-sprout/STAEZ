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
	</header>
	<main>
		<div id="community-wrapper">
			<ul id="community-nav" align="left">
				<li onclick=""><h2 class="selected">커뮤니티 메인</h2></li>
				<li onclick=""><h2>입문 가이드</h2></li>
				<li onclick=""><h2>질문과 답변</h2></li>
				<li onclick=""><h2>리뷰</h2></li>
				<li onclick=""><h2>자유게시판</h2></li>
				<li id="write-btn" onclick="location.href='incertForm.co'">
					<h2>글쓰기</h2>
					<img src="<c:url value='/resources/img/community/communityMain/write.png'/>" alt="">
				</li>
			</ul>
			<ul id="community-contents" align="left">
				<li id="community-search">
					<button>
						<img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
					</button>
					<input type="text" name="" id="">
				</li>
				<li id="community-category">
					<button class="btn-staez checked"><h4>뮤지컬</h4></button>
					<button class="btn-staez"><h4>클래식</h4></button>
					<button class="btn-staez"><h4>국악</h4></button>
					<button class="btn-staez"><h4>대중음악</h4></button>
					<button class="btn-staez"><h4>연극</h4></button>
					<button class="btn-staez"><h4>서커스/마술</h4></button>
					<button class="btn-staez"><h4>기타</h4></button>
				</li>
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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
				<li class="community-posting" onclick="location.href='detail.co'">
					<table>
						<tbody>
							<tr class="profile-area">
								<td rowspan="2"><img src="<c:url value='/resources/img/community/communityMain/profile-example.png'/>" alt=""></td>
								<td><h4>뮤덕이</h4></td>
								<td rowspan="5"><img src="<c:url value='/resources/img/community/communityMain/posting-img-example.png'/>" alt=""></td>
							</tr>
							<tr>
								<td>2024.05.01 00:00</td>
							</tr>
							<tr>
								<td colspan="2"><h3>웃는남자 리뷰</h3></td>
							</tr>
							<tr>
								<td colspan="2">연뮤덕입장 솔직하게 작성했습니다...</td>
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