<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myInquireList.css">
<script src="${contextPath}/resources/js/mypage/myInquireList.js"></script>

<title>Insert title here</title>
</head>

<body onload="init()">
	<header>
        <jsp:include page="../common/header.jsp" />
	</header>
	<main>
        <div class="title">
            마이페이지
        </div>

        <div class="main-section">
            <div class="side">
                <div class="profile">
                    <img src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                    <div id="profile-text">
                        <span>[아이디]</span>
                        <span>님</span><br>
                        <span>환영합니다</span>
                    </div>
                </div>
                <div class="side-menu">
                    <div class="small-title">마이페이지</div>
                    <ul>
                        <li><a href="${contextPath}/paymentList.me">결제내역</a></li>
                        <li><a href="${contextPath}/scrapList.me">찜목록</a></li>
                        <li><a href="${contextPath}/reviewList.me">한줄평</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">커뮤니티 관리</li>
                        <li><a href="${contextPath}/boardList.me">나의 게시글</a></li>
                        <li><a href="${contextPath}/likeList.me">좋아요</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">설정</li>
                        <li><a href="${contextPath}/updateForm.me">회원정보 변경</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">문의</li>
                        <li><a href="${contextPath}/inquireList.me">1:1 문의 내역</a></li>
                    </ul>
                        
                </div>
            </div>
            <div class="main-content">
                <div class="section-title">문의</div>

                <div class="main-title">
                    <h2>1:1 문의내역</h2>
                </div>

                <div id="inq-section">
                    <ul>
                        <c:forEach var="i" begin="0" end="7">
                        <li class="menu-item">
                            <div class="inq-info">
                                <span class="inq-cate">분류</span>
                                <span class="inq-title">환불 가능할까요?</span>
                                <span class="inq-date">2024-04-01</span>
                                <span class="folding-icon">▼</span>
                            </div>
                            <div class="fold-content hidden">
                                <div class="inquire">
                                    <p class="fold-title"><h3>문의내용</h3></p>
                                    <p>급한 사정이 생겨 예매 날짜에 가지 못하게됐습니다. 환불해주세요</p>
                                </div>
                                <hr>
                                <div class="answer">
                                    <p class="fold-title"><h3>답변내용</h3></p>
                                    <p>안됩니다</p> <!--답변이 null 일 경우 '답변을 기다리는 중입니다.'-->
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div>
                    <button><h4>문의하기</h4></button>
                </div>


                <div class="page-list">
                    <div class="pagination">
                        <img src="${contextPath}/resources/img/main/before.png">
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
                        <img src="${contextPath}/resources/img/main/after.png">
                    </div>
                </div>

            </div>
        
        </div>

	</main>
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>