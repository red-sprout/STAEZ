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
                    <input type="text" name="" id="">
                </div>
            </li>
            <li id="notice-category">
                <div>
                    <button class="btn-staez checked"><h3>공연</h3></button>
                    <button class="btn-staez"><h3>커뮤니티</h3></button>
                    <button class="btn-staez"><h3>예매</h3></button>
                    <button class="btn-staez"><h3>환불/취소</h3></button>
                    <button class="btn-staez"><h3>사이트 이용</h3></button>
                    <button class="btn-staez"><h3>티켓</h3></button>
                </div>
                <div class="">
                    <button class="btn-staez purple" onclick="location.href='incertForm.no'"><h3>작성</h3></button>
                </div>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li class="notice-posting">
                <table>
                    <tbody>
                        <tr class="profile-area">
                            <td rowspan="2"><img src="<c:url value='/resources/img/admin/notice/admin-profile.png'/>" alt=""></td>
                            <td><h4>관리자</h4></td>
                            <td rowspan="5"></td>
                        </tr>
                        <tr>
                            <td>2024.05.01 00:00</td>
                        </tr>
                        <tr>
                            <td colspan="2"><h3>매너댓글 부탁드립니다.</h3></td>
                        </tr>
                        <tr>
                            <td colspan="2">제목이 곧 내용입니다.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn-staez checked"><h4>공연</h4></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
            <li id="notice-pagination">
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