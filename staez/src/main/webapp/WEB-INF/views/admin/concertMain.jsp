<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/admin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/concertAdmin.css'/>">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</header>
    <nav>
        <jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
    </nav>
    <main>
        <ul id="admin-main-wrapper">
            <li id="admin-header">
                <h1>공연 검색</h1>
                <select>
                    <option>장르</option>
                    <option>공연명</option>
                    <option>포스터</option>
                    <option>장소</option>
                </select>
                <div id="admin-search">
                    <button>
						<img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
					</button>
					<input type="text" name="" id="">
                </div>
            </li>
            <li>
                <button class="btn-staez purple"><h4>추가</h4></button>
                <button class="btn-staez purple"><h4>수정</h4></button>
                <button class="btn-staez purple"><h4>삭제</h4></button>
            </li>
            <li id="admin-table" class="admin-middle">
                <form method="GET">
                    <table>
                        <thead>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>장르</td>
                                <td>공연명</td>
                                <td>포스터</td>
                                <td>시작일</td>
                                <td>종료일</td>
                                <td>장소</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>뮤지컬</td>
                                <td>천개의 파랑</td>
                                <td class="admin-poster">
                                    <img src="<c:url value='/resources/img/admin/poster-example.png'/>" alt="">
                                </td>
                                <td>2024.05.12</td>
                                <td>2024.05.26</td>
                                <td>예술의전당 CJ토월극장</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>뮤지컬</td>
                                <td>천개의 파랑</td>
                                <td class="admin-poster">
                                    <img src="<c:url value='/resources/img/admin/poster-example.png'/>" alt="">
                                </td>
                                <td>2024.05.12</td>
                                <td>2024.05.26</td>
                                <td>예술의전당 CJ토월극장</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>뮤지컬</td>
                                <td>천개의 파랑</td>
                                <td class="admin-poster">
                                    <img src="<c:url value='/resources/img/admin/poster-example.png'/>" alt="">
                                </td>
                                <td>2024.05.12</td>
                                <td>2024.05.26</td>
                                <td>예술의전당 CJ토월극장</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>뮤지컬</td>
                                <td>천개의 파랑</td>
                                <td class="admin-poster">
                                    <img src="<c:url value='/resources/img/admin/poster-example.png'/>" alt="">
                                </td>
                                <td>2024.05.12</td>
                                <td>2024.05.26</td>
                                <td>예술의전당 CJ토월극장</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>뮤지컬</td>
                                <td>천개의 파랑</td>
                                <td class="admin-poster">
                                    <img src="<c:url value='/resources/img/admin/poster-example.png'/>" alt="">
                                </td>
                                <td>2024.05.12</td>
                                <td>2024.05.26</td>
                                <td>예술의전당 CJ토월극장</td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </li>
            <li class="admin-middle">
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
    </main>
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>