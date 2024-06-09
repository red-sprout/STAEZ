<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/admin.css'/>">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/reserveMain.js'/>"></script>
	</header>
    <nav>
        <jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
    </nav>
    <main>
        <ul id="admin-main-wrapper">
            <li id="admin-header">
                <h1>예약내역 검색</h1>
                <select id="admin-select">
                    <option value="concertTitle">공연명</option>
                    <option value="name">예약자명</option>
                </select>
                <div id="admin-search">
                    <button>
                        <img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
                    </button>
                    <input type="text" name="" id="">
                </div>
            </li>
            <li>
                <button class="btn-staez purple" id="admin-update-reserve">
                    <h4>결제 완료</h4>
                </button>
                <button class="btn-staez purple" id="admin-delete-reserve">
                    <h4>예매 취소</h4>
                </button>
            </li>
            <li id="admin-table" class="admin-middle">
                <form method="GET">
                    <table>
                        <thead>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>예약번호</td>
                                <td>공연명</td>
                                <td>예매자이름(실명)</td>
                                <td>예약일</td>
                                <td>결제방법</td>
                                <td>상태</td>
                                <td>일정(시간)</td>
                            </tr>
                        </thead>
                        <tbody id="admin-contents"></tbody>
                    </table>
                </form>
            </li>
        </ul>
    </main>
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>