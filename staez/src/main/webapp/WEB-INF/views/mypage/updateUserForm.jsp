<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/updateUserForm.css">
<script src="${contextPath}/resources/js/mypage/updateUserForm.js"></script>
<script src="${contextPath}/resources/js/api/mypageapi.js"></script>


<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



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
                    <c:choose>
	            	    <c:when test="${empty loginUser}">
                            <span>로그인 해주세요</span>
                        </c:when>
                        <c:otherwise>
                            <img src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                            <div id="profile-text">
                                <span>[아이디]</span>
                                <span>님</span><br>
                                <span>환영합니다</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
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

                    <div id="password-auth" hidden>
                        <h3>비밀번호 인증</h3>
                        <div>
                            <input type="password" id="auth-password" placeholder="비밀번호 입력">
                            <button type="button" class="btn-staez purple" onclick="authPassword()">인증</button>
                        </div>
                        <p id="auth-fail" hidden>비밀번호가 일치하지 않습니다.</p>
                    </div>

                    <form action="update.me" method="POST" >
                        <div id="profile-img">
                            <img src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="" data-toggle="modal" data-target="#imgModal">
                        </div>
                        <div id="update-form">
                            <table>
                                <tbody>
                                    <tr>
                                        <th><h3>비밀번호</h3></th>
                                        <td id="pwd-btn">
                                            <button type="button" data-toggle="modal" data-target="#pwdModal">비밀번호 변경</button>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th><h3>아이디</h3></th>
                                        <td class="input-box">
                                            <input type="text" name="userId" value="${loginUser.userId}" readonly>
                                        </td>
                                        <td class="input-btn"></td>
                                    </tr>

                                    <tr>
                                        <th><h3>생년월일</h3></th>
                                        <td class="input-box">
                                            <input type="date" name="birth" value="${loginUser.birth}" readonly>
                                        </td>
                                        <td class="input-btn">
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><h3>닉네임</h3></th>
                                        <td class="input-box">
                                            <input type="text" name="nickname" value="${loginUser.nickname}" placeholder="" maxlength="16">
                                        </td>
                                        <td class="input-btn">
                                            <button type="button" onclick="checkNickname()">중복확인</button>
                                        </td>
                                    </tr>
                                    <tr class="warning-text">
                                        <td></td>
                                        <td><h5></h5></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th><h3>성별</h3></th>
                                        <td id="gender-input">
                                            <div>
                                                <label for="male">
                                                    <input type="radio" name="gender" id="male" value="M" 
                                                        <c:if test="${loginUser.gender == 'M'}">checked</c:if>>
                                                    <h4>남자</h4>
                                                </label>
                                                <label for="female">
                                                    <input type="radio" name="gender" id="female" value="F" 
                                                        <c:if test="${loginUser.gender == 'F'}">checked</c:if>>
                                                    <h4>여자</h4>
                                                </label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <c:set var="address" value="${loginUser.address}"  />
                                    <tr>
                                        <th><h3>주소</h3></th>
                                        <td class="input-box">
                                            <input type="text" id="addressNormal" value="${fn:split(address, '/')[0]}" onchange="resetAddressDetail()" readonly required>
                                        </td>
                                        <td class="input-btn">
                                            <button type="button" onclick="execDaumPostcode()">우편번호</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td class="input-box">
                                            <input type="text" placeholder="상세주소를 입력하세요" id="addressDetail" value="${fn:split(address, '/')[1]}" readonly required>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <input type="hidden" name="address" readonly>
                                    <c:remove var="address" />
                                    
                                    <c:set var="phone" value="${loginUser.phone}"  />
                                    <tr>
                                        <th><h3>휴대폰번호</h3></th>
                                        <td id="phone-input">
                                            <div>
                                                <input id="front-num" type="text" maxlength="3" value="010" readonly>
                                                <input id="phone1" type="text" value="${fn:substring(phone, 3, 7)}" minlength="4" maxlength="4" oninput="updateCombinedPhone()">
                                                <input id="phone2" type="text" value="${fn:substring(phone, 7, 11)}" minlength="4" maxlength="4" oninput="updateCombinedPhone()">
                                            </div>
                                        </td>
                                        <input type="hidden" name="phone" readonly>
                                        <td class="input-btn">
                                            <button type="button">인증</button>
                                        </td>
                                    </tr>
                                    <c:remove var="phone" />

                                    <c:set var="email" value="${loginUser.email}"  />
                                    <tr>
                                        <th><h3>이메일</h3></th>
                                        <td id="email-input">
                                            <div>
                                                <input type="text" id="email-front" oninput="updateCombinedEmail()" value="${fn:split(email, '@')[0]}" required> 
                                                <span>@</span>
                                                <input type="text" id="email-back" oninput="updateCombinedEmail()" value="${fn:split(email, '@')[1]}" required>
                                            </div>
                                        </td>
                                        <td class="input-btn">
                                            <select name="domain" onchange="emailDomain()">
                                                <option value="self-input">직접입력</option>
                                                <option value="naver.com">네이버</option>
                                                <option value="gmail.com">구글</option>
                                                <option value="daum.net">다음</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td class="input-box"><input type="text" placeholder="6자리 입력"></td>
                                        <td class="input-btn">
                                            <button type="button">인증</button>
                                        </td>
                                    </tr>
                                    <tr class="warning-text hidden">
                                        <td></td>
                                        <td><h5>잘못된 인증번호입니다</h5></td>
                                        <td></td>
                                    </tr>
                                    <input type="hidden" name="email" readonly>
                                    <c:remove var="email" />

                                    <tr>
                                        <th rowspan="2"><h3>관심장르(택3)</h3></th>
                                        <td colspan="2" rowspan="2" id="like-genre-input" >
                                            <div>
                                                <button type="button" class="btn-staez genre-btn"><h4>뮤지컬</h4></button>
                                                <button type="button" class="btn-staez genre-btn"><h4>클래식</h4></button>    
                                                <button type="button" class="btn-staez genre-btn"><h4>연극</h4></button>    
                                                <button type="button" class="btn-staez genre-btn"><h4>국악</h4></button>    
                                                <button type="button" class="btn-staez genre-btn full-width"><h4>대중음악</h4></button>    
                                                <button type="button" class="btn-staez genre-btn full-width"><h4>서커스/마술</h4></button>    
                                                <button type="button" class="btn-staez genre-btn full-width"><h4>기타</h4></button>    
                                            </div>
                                            <input type="text" name="genreLike" value="${loginUser.genreLike}" hidden> <!--button들 내용 추가-->
                                        </td>
                                    </tr>
                                    <tr> <!--크기 맞추기 위한 빈공간-->
                                        <th></th>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="submit-btn">
                            <button type="submit" class="btn-staez purple"><h3>저장</h3></button>
                            <button type="button" class="btn-staez purple" data-toggle="modal" data-target="#withdrawalModal"><h3>회원탈퇴</h3></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
	</main>

	 <!-- 패스워드 변경 Modal -->
     <div class="modal fade" id="pwdModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">비밀번호 변경</h3>
                    <button type="button" class="close" data-dismiss="modal" onclick="cancelUpdatePwd()">&times;</button>
                </div>
                
                <form action="updatePwd.me" method="POST">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="pwd-tag">
                            <div></div>
                            <div>
                                <h3>변경할 비밀번호</h3>
                                <input id="changePwd" type="password" name="newPwd" placeholder="영문 숫자 특수문자 포함 8글자 이상" oninput="checkPassword()" required>
                            </div>
                            <div class="pwd-check">
                                <h5></h5>                                
                            </div>
                            <div>
                                <h3>비밀번호 확인</h3>
                                <input id="checkPwd" type="password" oninput="checkPassword()" required>
                            </div>
                            <div class="pwd-check">
                                <h5></h5>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" disabled>변경</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="cancelUpdatePwd()">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

     <!-- 프로필 이미지 변경 Modal -->
     <div class="modal fade" id="imgModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">프로필 이미지 변경</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="POST">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="img-tag">
                            <div>
                                <img id="profile-preview" src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                            </div>
                            <div class="options">
                                <label>
                                    <input type="radio" name="profile-option" value="current" checked>
                                    <h4>현재 프로필 이미지</h4> 
                                </label>
                                <label>
                                    <input type="radio" name="profile-option" value="default">
                                    <h4>기본 이미지</h4>
                                    <input type="hidden" value="${contextPath}/resources/img/mypage/profile_img_default.png">
                                </label>
                                <label>
                                    <input type="radio" name="profile-option" value="new">
                                    <h4>변경할 이미지 선택</h4>
                                </label>
                                <input type="file" id="new-image-input" accept="image/*" >

                            </div>
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

    <!-- 회원탈퇴 Modal -->
    <div class="modal fade" id="withdrawalModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">회원탈퇴</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="GET">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="withdrawal-tag">
                            <h2>정말 탈퇴하시겠습니까?</h2>
                            <div>
                                <h3>비밀번호 확인</h3>
                                <input type="password">
                                <button type="button" class="btn-staez purple"><h3>확인</h3></button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">탈퇴</button>
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