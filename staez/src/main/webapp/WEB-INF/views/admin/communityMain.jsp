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
        <script src="<c:url value='/resources/js/admin/communityMain.js'/>"></script>
	</header>
    <nav>
        <jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
    </nav>
    <main>
        <ul id="admin-main-wrapper">
            <li id="admin-header">
                <h1>커뮤니티 검색</h1>
                <select id="admin-select">
                    <option value="userId">아이디</option>
                    <option value="nickname">닉네임</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <div id="admin-search">
                    <button>
						<img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
					</button>
					<input type="text" name="" id="">
                </div>
            </li>
            <li>
                <button class="btn-staez purple" id="admin-delete-community"><h4>삭제</h4></button>
                <button class="btn-staez purple" id="admin-genre-modal"><h4>장르 변경</h4></button>
                <button class="btn-staez purple" id="admin-div-modal"><h4>구분 변경</h4></button>
            </li>
            <li id="admin-table" class="admin-middle">
                <form method="GET">
                    <table>
                        <thead>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" onclick="checkboxTotalEvent(this)">
                                </td>
                                <td>
                                    아이디
                                </td>
                                <td>닉네임</td>
                                <td>제목</td>
                                <td>내용</td>
                            </tr>
                        </thead>
                        <tbody id="admin-contents"></tbody>
                    </table>
                </form>
            </li>
        </ul>
    </main>
    <!-- The Modal -->
    <div class="modal" id="genre-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">장르 선택</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
    
                <!-- Modal body -->
                <div class="modal-body" id="community-genre"></div>
    
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateCategoryEvent('genre', 2)">수정</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal" id="div-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">구분 선택</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
    
                <!-- Modal body -->
                <div class="modal-body" id="community-div"></div>
    
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateCategoryEvent('div', 1)">수정</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>