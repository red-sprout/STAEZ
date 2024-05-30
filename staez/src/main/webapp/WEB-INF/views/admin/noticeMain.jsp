<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/notice.css'/>">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/noticeMain.js'/>"></script>
	</header>
    <main>
        <ul id="notice-contents" align="left">
            <li id="notice-header">
                <h1>공지사항</h1>
                <select>
                    <option>제목</option>
                    <option>내용</option>
                    <option>카테고리</option>
                </select>
                <div id="notice-search">
                    <button>
                        <img src="<c:url value='/resources/img/admin/notice/search-icon.png'/>" alt="">
                    </button>
                    <input type="text" name="keyword">
                </div>
            </li>
            <li id="notice-category">
                <div id="category-div"></div>
                <div class="">
                    <button class="btn-staez purple" onclick="location.href='incertForm.no'"><h3>작성</h3></button>
                </div>
            </li>
            <c:forEach var="b" items="${list}">
                <li class="notice-posting" onclick="location.href='detail.no?boardNo=${b.boardNo}'">
                    <table>
                        <tbody>
                            <tr class="profile-area">
                                <td rowspan="2"><img src="" alt=""></td>
                                <td><h4>${b.nickname}</h4></td>
                                <td rowspan="5">
                                    <input type="hidden" name="boardNo" value="${b.boardNo}" class="boardNo">
                                    <input type="hidden" name="userNo" value="${b.userNo}" class="userNo">
                                </td>
                            </tr>
                            <tr>
                                <td>${b.boardWriteDate}</td>
                            </tr>
                            <tr>
                                <td colspan="2"><h3>${b.boardTitle}</h3></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="boardContent">${b.boardContent}</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button class="btn-staez checked"><h4>${b.categoryName}</h4></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </li>
            </c:forEach>
            <!-- <li id="notice-pagination">
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