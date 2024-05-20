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
    <nav>
        <jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
    </nav>
    <main>
        <ul id="admin-main-wrapper">
            <li id="admin-header">
                <h1>이용자 검색</h1>
                <select>
                    <option>아이디</option>
                    <option>닉네임</option>
                    <option>권한</option>
                    <option>전화번호</option>
                    <option>이메일</option>
                </select>
                <div id="admin-search">
                    <button>
						<img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
					</button>
					<input type="text" name="" id="">
                </div>
            </li>
            <li>
                <button class="btn-staez purple"><h4>강퇴</h4></button>
                <button class="btn-staez purple"><h4>권한</h4></button>
                <button class="btn-staez purple" data-toggle="modal" data-target="#myModal"><h4>메일</h4></button>
            </li>
            <li id="admin-table" class="admin-middle">
                <form method="GET">
                    <table>
                        <thead>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
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
                        <tbody>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
                            </tr>
                            <tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td>
                                    abc123
                                </td>
                                <td>abc</td>
                                <td>관리자</td>
                                <td>010-1111-2222</td>
                                <td>abc123@staez.com</td>
                                <td>2024.05.01</td>
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
                        <button type="submit" class="btn btn-primary">전송</button>
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