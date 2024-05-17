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
	</header>
    <main>
        <ul id="admin-main-wrapper">
            <li id="admin-header">
                <h1>FAQ 검색</h1>
                <select>
                    <option>작성자</option>
                    <option>카테고리</option>
                    <option>제목</option>
                    <option>내용</option>
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
                                <td>작성자</td>
                                <td>카테고리</td>
                                <td>제목</td>
                                <td>내용</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>abc123</td>
                                <td>공연</td>
                                <td>제목입니다.</td>
                                <td>내용입니다.</td>
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