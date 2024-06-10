<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeDetail.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/noticeDetail.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <ul id="community-contents">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <input type="hidden" name="writerNo" value="${n.userNo}">
                <input type="hidden" name="boardNo" value="${n.boardNo}">
                <h1 class="left">공지사항</h1>
                <hr>
                <li id="community-category" class="left">
                    <button class="btn-staez checked"><h4>${n.categoryName}</h4></button>
                </li>
                <li class="left">
                    <h1>${n.boardTitle}</h1>
                </li>
                <li class="left">
                    <table>
                        <tbody>
                            <tr class="profile-area">
                                <td rowspan="2"><img id="notice-profile-img" src="<c:url value='/resources/uploadfiles/profile/no-data.png'/>" alt=""></td>
                                <td><h3>${n.nickname}</h3></td>
                                <td rowspan="2">
                                    <div>
                                        <c:if test="${loginUser.userNo eq n.userNo}">
                                            <button class="function" onclick="location.href='updateForm.no?boardNo=${n.boardNo}'">수정</button>
                                            <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                            <button class="function">삭제</button>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                            <input type="hidden" name="boardWriteDate" value="${n.boardWriteDate}">
                            <tr class="profile-area">
                                <td id="detail-write-date"></td>
                            </tr>
                        </tbody>
                    </table>
                </li>
                <li class="left">${n.boardContent}</li>
                <li class="middle">
                    <div class="community-circle-area" onclick="likeToggle(this)">
                        <img><h4></h4>
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