<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/updateInfoForm.css">
<script src="${contextPath}/resources/js/mypage/updateInfoForm.js"></script>

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
                <div class="section-title">설정</div>
                
                <div class="main-title">
                    <h2>회원정보변경</h2>
                </div>                
                <div id="profile-update">
                    <form action="updatezzzzz" method="GET">
                        <div id="profile-img">
                            <img src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                        </div>
                        <div id="update-form">
                            <table>
                                <tr>
                                    <th><h3>닉네임</h3></th>
                                    <td class="input-box">
                                        <input type="text">
                                    </td>
                                    <td class="input-btn">
                                        <button type="button">중복확인</button>
                                    </td>
                                </tr>
                                <tr class="warning-text">
                                    <td></td>
                                    <td><h5>중복된 닉네임입니다</h5></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>아이디</h3></th>
                                    <td class="input-box">
                                        <input type="text" name="userId">
                                    </td>
                                    <td class="input-btn"></td>
                                </tr>
                                <tr>
                                    <th><h3>비밀번호</h3></th>
                                    <td id="pwd-btn">
                                        <button type="button" data-toggle="modal" data-target="#myModal">비밀번호 변경</button>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>성별</h3></th>
                                    <td id="gender-input">
                                        <div>
                                            <div>
                                                <input type="radio" name="gender" id="male">
                                                <label for="male">남</label>
                                            </div>
                                            <div>
                                                <input type="radio" name="gender" id="female">
                                                <label for="female">여</label>
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>주소</h3></th>
                                    <td class="input-box">
                                        <input type="text" name="address">
                                    </td>
                                    <td class="input-btn">
                                        <button type="button">우편번호</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td class="input-box">
                                        <input type="text" placeholder="상세주소를 입력하세요">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>휴대폰번호</h3></th>
                                    <td id="phone-input">
                                        <div>
                                            <select name="front-phone-no" id="">
                                                <option value="1">010</option>
                                                <option value="2">011</option>
                                            </select>
                                            <input type="text" maxlength="4" >
                                            <input type="text" maxlength="4">
                                        </div>
                                    </td>
                                    <td class="input-btn">
                                        <button type="button">인증번호</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td class="input-box"><input type="text" placeholder="6자리 입력"></td>
                                    <td class="input-btn">
                                        <button type="button">인증</button>
                                    </td>
                                </tr>
                                <tr class="warning-text">
                                    <td></td>
                                    <td><h5>잘못된 인증번호입니다</h5></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>이메일</h3></th>
                                    <td id="email-input">
                                        <div>
                                            <input type="text"> 
                                            <span>@</span>
                                            <input type="text">
                                        </div>
                                    </td>
                                    <td class="input-btn">
                                        <select name="domain" id="">
                                            <option value="self-input">직접입력</option>
                                            <option value="naver">naver.com</option>
                                            <option value="google">gmail.com</option>
                                            <option value="daum">daum.net</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2"><h3>관심장르</h3></th>
                                    <td colspan="2" rowspan="2" id="like-genre-input" >
                                        <div>
                                            <button type="button" class="btn-staez checked"><h4>뮤지컬</h4></button>
                                            <button type="button" class="btn-staez"><h4>클래식</h4></button>    
                                            <button type="button" class="btn-staez"><h4>연극</h4></button>    
                                            <button type="button" class="btn-staez"><h4>국악</h4></button>    
                                            <button type="button" class="btn-staez checked full-width"><h4>대중음악</h4></button>    
                                            <button type="button" class="btn-staez full-width"><h4>서커스/마술</h4></button>    
                                            <button type="button" class="btn-staez full-width"><h4>기타</h4></button>    
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                        <div id="submit-btn">
                            <button type="submit" class="btn-staez purple"><h3>저장</h3></button>
                            <button type="button" class="btn-staez purple"><h3>탈퇴</h3></button>
                        </div>
                    </form>
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
                                    <td rowspan="5"><img src="poster.png" alt=""></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td><h3>뮤지컬 〈천개의 파랑〉</h3></td>
                                </tr>
                                <tr>
                                    <td>예술의전당 콘서트홀</td>
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
                                <span class="star-icon"><img src="star.png" alt=""></span>
                            </label>
                            <label class="star-label">
                                <input type="radio" value="2" class="hidden" onclick="starRating(this);">
                                <span class="star-icon"><img src="star.png" alt=""></span>
                            </label>
                            <label class="star-label">
                                <input type="radio" value="3" class="hidden" onclick="starRating(this);">
                                <span class="star-icon"><img src="star.png" alt=""></span>
                            </label>
                            <label class="star-label">
                                <input type="radio" value="4" class="hidden" onclick="starRating(this);">
                                <span class="star-icon"><img src="star.png" alt=""></span>
                            </label>
                            <label class="star-label">
                                <input type="radio" value="5" class="hidden" onclick="starRating(this);">
                                <span class="star-icon"><img src="star.png" alt=""></span>
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