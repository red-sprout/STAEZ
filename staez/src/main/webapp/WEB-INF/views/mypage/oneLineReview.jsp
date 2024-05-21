<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/oneLineReview.css">
<script src="${contextPath}/resources/js/mypage/oneLineReview.js"></script>
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
                        <span>00님</span><br>
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
                <div class="main-title">
                    <h2>한줄평</h2>
                </div>
                <table>
                    <tr>
                        <td id="concert-img">
                            <img src="${contextPath}/resources/img/mypage/chicago.gif" alt="">
                        </td>
                        <td id="content">
                            <h3>꽃 별이지나</h3>
                            <h4>꽃이 왜 별이죠. 공감못하겠으니 5점 드립니다.</h4>
                        </td>
                        <td id="review-func">
                            <span>
                                <img src="${contextPath}/resources/img/mypage/star-filled.png" alt=""> 
                                <h4>5</h4>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td id="concert-img">
                            <img src="${contextPath}/resources/img/mypage/chicago.gif" alt="">
                        </td>
                        <td id="content">
                            <h3>꽃 별이지나</h3>
                            <h4>꽃이 왜 별이죠. 공감못하겠으니 5점 드립니다.</h4>
                        </td>
                        <td id="review-func">
                            <button type="button" data-toggle="modal" data-target="#myModal"><h4>후기작성</h4></button>
                        </td>
                    </tr>
                    <tr>
                        <td id="concert-img">
                            <img src="${contextPath}/resources/img/mypage/chicago.gif" alt="">
                        </td>
                        <td id="content">
                            <h3>꽃 별이지나</h3>
                            <h4>꽃이 왜 별이죠. 공감못하겠으니 5점 드립니다.</h4>
                        </td>
                        <td id="review-func">
                            <button type="button" data-toggle="modal" data-target="#myModal"><h4>수정</h4></button>
                        </td>
                    </tr>
                </table>

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
    	 <!-- The Modal -->
         <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h3 class="modal-title">한줄평</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <form method="POST">
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="concert-tag">
                                <table>
                                    <tr>
                                        <td rowspan="5">
                                            <img src="${contextPath}/resources/img/mypage/chicago.gif" alt="">
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><h3>꽃 별이지나</h3></td>
                                    </tr>
                                    <tr>
                                        <td>서경대학교 공연예술센터 스콘 1관</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            관람일 : 2024.05.12 (월) 14:00 (130분)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="star-rating">
                                <h3>별점</h3>
                                <label class="star-label">
                                    <input type="radio" value="1" class="hidden" onclick="starRating(this);">
                                    <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png" alt=""></span>
                                </label>
                                <label class="star-label">
                                    <input type="radio" value="2" class="hidden" onclick="starRating(this);">
                                    <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png" alt=""></span>
                                </label>
                                <label class="star-label">
                                    <input type="radio" value="3" class="hidden" onclick="starRating(this);">
                                    <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png" alt=""></span>
                                </label>
                                <label class="star-label">
                                    <input type="radio" value="4" class="hidden" onclick="starRating(this);">
                                    <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png" alt=""></span>
                                </label>
                                <label class="star-label">
                                    <input type="radio" value="5" class="hidden" onclick="starRating(this);">
                                    <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png" alt=""></span>
                                </label>
                            </div>
                            <div class="comment-area">
                                <h3>한줄평</h3>
                                <textarea rows="4" placeholder="200자"></textarea>
                            </div>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">저장</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>