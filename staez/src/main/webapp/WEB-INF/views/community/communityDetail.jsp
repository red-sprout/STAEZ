<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/community/communityDetail.css'/>">
<script src="<c:url value='/resources/js/community/communityDetail.js'/>"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div id="community-wrapper">
            <ul id="community-nav" align="left">
                <li onclick="">
                    <h2 class="selected">커뮤니티 메인</h2>
                </li>
                <li onclick="">
                    <h2>입문 가이드</h2>
                </li>
                <li onclick="">
                    <h2>질문과 답변</h2>
                </li>
                <li onclick="">
                    <h2>리뷰</h2>
                </li>
                <li onclick="">
                    <h2>자유게시판</h2>
                </li>
                <li id="write-btn" onclick="location.href='incertForm.cm'">
                    <h2>글쓰기</h2>
                    <img src="<c:url value='/resources/img/community/communityMain/write.png'/>" alt="">
                </li>
            </ul>
            <ul id="community-contents">
                <li id="community-category">
                    <button class="btn-staez"><h4>클래식</h4></button>
                    <button class="btn-staez"><h4>자유게시판</h4></button>
                </li>
                <li>
                    <h1>임윤찬 "현상"이 되다.</h1>
                </li>
                <li>
                    <table>
                        <tbody>
                            <tr class="profile-area">
                                <td rowspan="2"><img src="<c:url value='/resources/img/community/communityDetail/profile-example.png'/>" alt=""></td>
                                <td><h3>전자인간</h3></td>
                                <td rowspan="2">
                                    <div>
                                        <button class="function" onclick="location.href='updateForm.cm'">수정</button>
                                        <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                        <button class="function">삭제</button>
                                        <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                                        <button class="function" data-toggle="modal" data-target="#myModal">신고</button>
                                    </div>
                                </td>
                            </tr>
                            <tr class="profile-area">
                                <td>2024.05.01 00:00</td>
                            </tr>
                        </tbody>
                    </table>
                </li>
                <li>
                    <p>
                        작년 삼성 인재개발원에서 있었던 임윤찬 리사이틀 때 쇼팽 에튜드 op.10을 듣고 "훌륭한 연주이긴 하지만 루바토가 과잉하고 설익은 느낌"이라고 생각했었더랬지요. 여기 공연후기에도 그런 감상을 썼었고요. 그리고는
                        반년 정도 흘러 얼마전에 발매된 쇼팽 에튜드 op.10, op.25 전곡을 구매해서 들어 보고는 깜짝 놀랐습니다. 단점이라고 생각되었던 부분은 거의 드러나지 않으면서, '천의무봉'이나 '비단결' 같은 진부한
                        표현으로만 그 진가를 표현할 수 있는 완벽한 테크닉에 임윤찬 특유의 열정적이고 톡톡튀는 해석이 덧입혀져 있어서, "와, 이친구 그동안 정말 각고의 노력을 기울였보다"라는 감탄이 튀어나왔던 겁니다.
                    </p>
                </li>
                <li>
                    <p>
                        그렇게 범상치 않은 연주라는 감상에 젖어있는데, 프레스토뮤직에서 임윤찬 에튜드를 금주의 앨범에 선정하더라구요.
                    </p>
                </li>
                <li>
                    <img src="<c:url value='/resources/img/community/communityDetail/yunchan.png'/>" alt="">
                </li>
                <li>
                    <a class="detail-url" href="www.prestomusic.com">
                        <h4>Chopin Études from Yunchan Lim</h4>
                        <span>www.prestomusic.com</span>
                    </a>
                </li>
                <li>
                    <p>
                        ​그리고 오늘 가디언에는 까칠하고 깐깐해 보이는 앤드류 클레멘스 평론가가 침을 튀겨가며 임윤찬 에튜드를 칭찬하면서 이주의 앨범에 선정했네요. 별 다섯개와 함께...
                    </p>
                </li>
                <li id="reply-cnt">
                    <h1>댓글&nbsp;</h1>
                    <h1>2</h1>
                </li>
                <li>
                    <div class="community-reply-input">
                        <div class="reply-profile-area">
                            <img src="<c:url value='/resources/img/community/communityDetail/profile-example.png'/>" alt="">
                        </div>
                        <textarea name="" id="reply-input"></textarea>
                        <button>댓글 쓰기</button>
                    </div>
                </li>
                <li class="reply-flex">
                    <div class="community-reply">
                        <div class="reply-menu">
                            <button class="function">수정</button>
                            <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                            <button class="function">삭제</button>
                            <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                            <button class="function">답글</button>
                        </div>
                        <div class="reply-wrapper">
                            <div class="reply-profile-area">
                                <img src="<c:url value='/resources/img/community/communityDetail/profile-example.png'/>" alt="">
                            </div>
                            <div class="reply-contents">
                                <div class="reply-text">
                                    <h3>작은 숲</h3>
                                    <p>말 그대로 phenomenal 이네요!!</p>
                                </div>
                                <div class="reply-like" onclick="likeToggle(this)">
                                    <img src="<c:url value='/resources/img/community/communityDetail/like-no.png'/>" alt="">
                                    <h4>3</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="reply-flex">
                    <div class="reply-level"></div>
                    <div class="community-reply">
                        <div class="reply-menu">
                            <button class="function">수정</button>
                            <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                            <button class="function">삭제</button>
                            <img src="<c:url value='/resources/img/common/header/divide.png'/>" alt="">
                            <button class="function">답글</button>
                        </div>
                        <div class="reply-wrapper">
                            <div class="reply-profile-area">
                                <img src="<c:url value='/resources/img/community/communityDetail/profile-example.png'/>" alt="">
                            </div>
                            <div class="reply-contents">
                                <div class="reply-text">
                                    <h3>작은 숲</h3>
                                    <p>말 그대로 phenomenal 이네요!!</p>
                                </div>
                                <div class="reply-like" onclick="likeToggle(this)">
                                    <img src="<c:url value='/resources/img/community/communityDetail/like-no.png'/>" alt="">
                                    <h4>3</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </main>
    <div class="community-fixed">
        <div class="community-circle-area" onclick="likeToggle(this)">
            <img src="<c:url value='/resources/img/community/communityDetail/like-yes.png'/>" alt="">
            <h4>27</h4>
        </div>
        <hr>
        <div class="community-circle-area" onclick="commentFocus()">
            <img src="<c:url value='/resources/img/community/communityDetail/reply.png'/>" alt="">
            <h4>3</h4>
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