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
        <script src="<c:url value='/resources/js/admin/userMain.js'/>"></script>
	</header>
    <nav>
        <jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
    </nav>
    <main>
        <ul id="admin-main-wrapper">
            <li id="admin-header">
                <h1>이용자 검색</h1>
                <select id="admin-select">
                    <option value="userId">아이디</option>
                    <option value="nickname">닉네임</option>
                    <option value="phone">전화번호</option>
                    <option value="email">이메일</option>
                </select>
                <div id="admin-search">
                    <button>
						<img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
					</button>
					<input type="text" name="" value="">
                </div>
            </li>
            <li>
                <button class="btn-staez purple" id="admin-delete-user"><h4>강퇴</h4></button>
                <button class="btn-staez purple" id="admin-update-modal"><h4>권한</h4></button>
                <button class="btn-staez purple" data-toggle="modal" data-target="#myModal"><h4>메일</h4></button>
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
                                <td>권한</td>
                                <td>전화번호</td>
                                <td>이메일</td>
                                <td>가입일</td>
                            </tr>
                        </thead>
                        <tbody id="admin-contents"></tbody>
                    </table>
                </form>
            </li>
        </ul>
    </main>
    <!-- The Modal -->
    <div class="modal" id="grade-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">권한 선택</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body"></div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateUserEvent()">수정</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">메일보내기</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="POST">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <ul>
                            <li>
                                <h3>제목</h3>
                                <input type="text" name="" id="">
                            </li>
                            <li>
                                <h3>내용</h3>
                                <textarea name="" id=""></textarea>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">전송</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>