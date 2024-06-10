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
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/concertMain.js'/>"></script>
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
                <button class="btn-staez purple" onclick="location.href='concertIncertForm.ad'"><h4>추가</h4></button>
                <button class="btn-staez purple" onclick="location.href='concertUpdateForm.ad'"><h4>수정</h4></button>
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
                        <tbody class="admin-concert-container"></tbody>
                    </table>
                </form>
            </li>
            <li class="admin-middle">
                <div class="page-list"></div>
            </li>
        </ul>
    </main>
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>