<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/updateUserInfo.css">

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
                        <li><a href="${contextPath}/payment.my">결제내역</a></li>
                        <li><a href="${contextPath}/save.my">찜목록</a></li>
                        <li><a href="${contextPath}/review.my">한줄평</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">커뮤니티 관리</li>
                        <li><a href="${contextPath}/board.my">나의 게시글</a></li>
                        <li><a href="${contextPath}/like.my">좋아요</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">설정</li>
                        <li><a href="${contextPath}/update.my">회원정보 변경</a></li>
                    </ul>
                    <ul>
                        <li><a href="${contextPath}/inquire.my">1:1 문의 내역</a></li>
                    </ul>
                        
                </div>
            </div>
            <div class="main-content">
                <div class="section-title">설정</div>
                
                <div class="main-title">
                    <h2>회원정보변경</h2>
                </div>                
                <div id="profile-update">
                    <form action="updatezzzzz">
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
                                        <input type="text">
                                    </td>
                                    <td class="input-btn"></td>
                                </tr>
                                <tr>
                                    <th><h3>비밀번호</h3></th>
                                    <td id="pwd-btn">
                                        <button type="button">비밀번호 변경</button>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>성별</h3></th>
                                    <td id="gender-input">
                                        <div>
                                            <input type="radio" name="gender" id="male">
                                            <label for="male">남</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="gender" id="female">
                                            <label for="female">여</label>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><h3>주소</h3></th>
                                    <td class="input-box">
                                        <input type="text">
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
                                        <select name="front-phone-no" id="">
                                            <option value="1">010</option>
                                            <option value="1">011</option>
                                        </select>
                                        -
                                        <input type="text">
                                        -
                                        <input type="text">
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
                                <tr>
                                    <th><h3>이메일</h3></th>
                                    <td class="input-box">
                                        <input type="email">
                                    </td>
                                    <td class="input-btn"></td>
                                </tr>
                                <tr>
                                    <th><h3>관심장르</h3></th>
                                    <td colspan="2">
                                        <button type="button" class="btn-staez checked"><h4>뮤지컬</h4></button>
                                        <button type="button" class="btn-staez"><h4>클래식</h4></button>    
                                        <button type="button" class="btn-staez"><h4>연극</h4></button>    
                                        <button type="button" class="btn-staez"><h4>국악</h4></button>    
                                        <button type="button" class="btn-staez checked"><h4>대중음악</h4></button>    
                                        <button type="button" class="btn-staez"><h4>서커스/마술</h4></button>    
                                        <button type="button" class="btn-staez"><h4>기타</h4></button>    
                                    </td>
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
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>