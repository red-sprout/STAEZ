<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/community/communityDetail.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/communityapi.js'/>"></script>
        <script src="<c:url value='/resources/js/community/communityDetail.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <ul id="community-nav" align="left"></ul>
            <ul id="community-contents" align="left">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <input type="hidden" name="writerNo" value="${board.userNo}">
                <input type="hidden" name="boardNo" value="${board.boardNo}">
                <input type="hidden" name="tag" value="${tag.concertNo}">
                <h1>커뮤니티</h1>
                <hr>
                <li id="community-category"></li>
                <li>
                    <h1>${board.boardTitle}</h1>
                </li>
                <li>
                    <table>
                        <tbody>
                            <tr class="profile-area">
                                <td rowspan="2">
                                    <img id="profile-img" src="">
                                </td>
                                <td>
                                    <h3>${board.nickname}</h3>
                                </td>
                                <td rowspan="2">
                                    <div>
                                        <c:choose>
                                            <c:when test="${loginUser.userNo eq board.userNo}">
                                                <c:choose>
                                                    <c:when test="${tag.concertNo eq null}">                                                        
                                                        <button class="function" onclick="location.href='updateForm.cm?boardNo=${board.boardNo}'">수정</button>
                                                        <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                                        <button class="function" onclick="location.href='delete.cm?boardNo=${board.boardNo}'">삭제</button>
                                                        <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                                        <button class="function" data-toggle="modal" data-target="#myModal">신고</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="function" onclick="location.href='updateForm.cm?boardNo=${board.boardNo}&concertNo=${tag.concertNo}'">수정</button>
                                                        <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                                        <button class="function" onclick="location.href='delete.cm?boardNo=${board.boardNo}'">삭제</button>
                                                        <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                                        <button class="function" data-toggle="modal" data-target="#myModal">신고</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="function" data-toggle="modal" data-target="#myModal">신고</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                            <tr class="profile-area">
                                <td>${board.boardWriteDate}</td>
                            </tr>
                        </tbody>
                    </table>
                </li>
                <li id="board-content">${board.boardContent}</li>
                <li id="reply-cnt">
                    <h1>댓글&nbsp;</h1>
                    <h1 class="reply-cnt"></h1>
                </li>
                <li id="reply-input-area">
                    <div class="community-reply-input">
                        <div class="reply-profile-area">
                            <img src="<c:url value='/resources/uploadfiles/profile/basic_profile.jpg'/>" alt="">
                        </div>
                        <textarea name="replyInput" id="reply-input"></textarea>
                        <button onclick="insertReply()">댓글 쓰기</button>
                    </div>
                </li>
            </ul>
        </div>
    </main>
    <div class="community-fixed">
        <div class="community-circle-area" onclick="likeToggle(this)">
            <img><h4></h4>
        </div>
        <hr>
        <div class="community-circle-area" onclick="replyFocus()">
            <img src="<c:url value='/resources/img/community/communityDetail/reply.png'/>" alt="">
            <h4 class="reply-cnt"></h4>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">신고하기</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="POST">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <ul>
                            <li>
                                <h3>제목</h3>
                                <input type="text" name="">
                            </li>
                            <li>
                                <h3>내용</h3>
                                <textarea name=""></textarea>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">신고</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
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