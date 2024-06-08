<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/user/insertForm.css">
    <!-- 주소 카카오 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>회원가입</title>
</head>
<body onload="init()">
    <header>
        <!-- js -->
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <script src="${contextPath}/resources/js/api/userapi.js"></script>
        <script src="${contextPath}/resources/js/user/insertForm.js"></script>
    </header>
    <main>
        <div class="image-container">
            <img src="${contextPath}/resources/img/user/dlatl.png" alt="광고배너">
        </div>
        <h1 class="signin-h1">정보입력</h1>
        <hr>
        <form id="enrollForm" action="insert.me" method="post">
            <div class="insert-member">
                <table class="insert-member-table">
                    <tr>
                        <th>닉네임</th>
                        <td colspan="1">
                            <input type="text" placeholder="한문 + 영문" name="nickname" id="nickname" maxlength="16" required >
                        </td>
                        <td><input type="button" id="nickNameCheckButton" class="check_nickname check_button" value="중복검사"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="4">
                            <div id="checkResultNick" class="checkResult">
                                <span id="nicknameErrorMessage"></span>
                            </div>
                        </td>
                    </tr>                 
                    <tr>
                        <th>아이디</th>
                        <td colspan="1">
                            <input type="text" placeholder="영문 + 숫자" name="userId" id="user_Id" maxlength="16" required >
                        </td>
                        <td><input type="button" id="idcheckButton" class="check_userId check_button" value="중복검사"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="4">
                            <div id="checkResultId" class="checkResult">
                                <span id="userIdErrorMessage"></span>
                            </div>
                        </td>
                    </tr>                                                  
                    <tr>
                        <th>비밀번호</th>
                        <td colspan="2">
                            <div style="position: relative;">
                                <input type="password" id="password1" name="userPwd" placeholder="영문 숫자 특수문자 포함 8글자 이상" required >
                                <img src="${contextPath}/resources/img/user/pwd.png" id="pwdImg" alt="비밀번호 보기">
                            </div>
                        </td>
                    </tr>                    
                    <tr>
                        <th>비밀번호 확인</th>
                        <td colspan="1"><input type="password" id="password2" name="user_pwdCheck" placeholder="똑같이 입력하셔야 합니다." required ></td>
                        <td colspan="1"><input type="button" class="check_button" value="확인" required onclick="validatePassword()"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="4" id="passwordMessage"></td>
                    </tr>
                    <tr>
                        <th>휴대폰 번호</th>
                        <td class="email-container" colspan="5" >
                            <div id="td-div">
                                <span id="phone-prefix">010</span>
                                <span>-</span>
                                <input type="text" id="phone-suffix1" name="phone-suffix1" maxlength="4" >
                                <span>-</span>
                                <input type="text" id="phone-suffix2" name="phone-suffix2" maxlength="4">
                                <input type="text" name="phone" id="input-value-phone" required  >
                            </div>
                        </td>
                    </tr>  
                        <tr>
                            <th>생년월일</th>
                            <td colspan="5" class="email-container">
                                <input type="date" name="birth" required>
                            </td>   
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="6" class="email-container" id="insertEmail" name="insertEmail">
                            <div style="display: flex;">
                                <input type="text" id="email-prefix" placeholder="이메일 아이디">
                                <span id="email-prefix-shift2">@</span>
                                <input type="text" id="email-suffix" placeholder="직접 입력">
                                <input type="text" name="email" id="input-value-email" readonly>
                            </div>
                        </td>
                        <td>
                            <select class="box" id="email-domain-list">
                                <option value="type">직접 입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
                        </td>
                        <td colspan="">
                            <input type="button" id="emailCheckButton" class="check_button" value="인증번호 전송">
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <div id="emailTimeContainer">
                                <input type="text" id="verification-code" required><div id="timer"></div>
                            </div>
                        </td>
                        <td>
                            <input type="button" class="check_button" id="check_emailSecretBtn" value="인증확인">
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="4">
                            <div id="checkResultEamil" class="checkResult">
                                <span id="userEmailErrorMessage"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td colspan="2">
                            <input type="radio" id="Male" value="M" name="gender" checked>
                            <label for="Male">남자</label> &nbsp;&nbsp;
                            <input type="radio" id="Female" value="F" name="gender">
                            <label for="Female">여자</label> &nbsp;&nbsp;
                        </td>
                        
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="2"><input type="text" class="addressInput" id="sample6_address" readonly></td>
                        <td><input type="button" class="check_button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" required></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="1"><input type="text" class="detailAddressInput" id="sample6_detailAddress" placeholder="자세한 주소 : 동 / 호수" name="address-detail"></td>
                        <td colspan="1"><input type="text" id="sample6_postcode" placeholder="우편번호"></td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text" name="address" id="input-value-address" readonly></td>
                    </tr> 
                    <tr>
                        <th>관심장르(택3)</th>
                        <td colspan="4" id="genre-buttons">
                            <button type="button" class="btn-staez3" data-genre="클래식"><h3>클래식</h3></button>
                            <button type="button" class="btn-staez3" data-genre="국악"><h3>국악</h3></button>
                            <button type="button" class="btn-staez3" data-genre="대중음악"><h3>대중음악</h3></button>
                            <button type="button" class="btn-staez3" data-genre="기타"><h3>기타</h3></button>
                            <button type="button" class="btn-staez3" data-genre="뮤지컬"><h3>뮤지컬</h3></button>
                            <button type="button" class="btn-staez3" data-genre="연극"><h3>연극</h3></button>
                            <button type="button" class="btn-staez3" data-genre="서커스/마술"><h3>서커스/마술</h3></button>
                            <input type="text" name="genreLike" id="input-value-genreLike"> <!--button들 내용 추가-->
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="insert-member-div">
                                <button type="button" id="backButton">이전</button>
                                <button type="submit" id="submitButton" onsubmit="return validateForm()">다음</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>   
</body>
</html>