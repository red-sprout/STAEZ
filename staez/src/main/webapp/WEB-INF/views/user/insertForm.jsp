<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/user/insertForm.css">
    <!-- js -->
    <script src="${contextPath}/resources/js/user/insertForm.js"></script>
    <!-- 주소 카카오 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- Bootstrap 4 Tutorial -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>회원가입</title>
</head>
<body onload="init()">
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
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
                        <td colspan="2">
                            <input type="text" placeholder="한문 영문 16글자 이하" name="nickname" id="nickname" maxlength="16" required>
                        </td>
                        <td>
                            <input type="button" id="nickNameCheckButton" class="check_nickname" value="중복검사">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div id="checkResultNick">
                                <span id="nicknameErrorMessage" style="color: red;"></span>
                            </div>
                        </td>
                    </tr>                    
                    <tr>
                        <th>아이디</th>
                        <td colspan="2">
                            <input type="text" placeholder="영문 숫자 16글자 이하" name="user_id" id="userId" required>
                        </td>
                        <td><input type="button" id="idcheckButton" class="check_userId" value="중복검사"></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div id="checkResultId">
                                <span id="userIdErrorMessage" style="color: red;"></span>
                            </div>
                        </td>
                    </tr>                                                     
                    <tr>
                        <th>비밀번호</th>
                        <td colspan="2"><input type="password" id="password1" placeholder="영문 숫자 특수문자 포함 16글자 이내" name="user_pwd"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td colspan="2"><input type="password" id="password2" onkeyup="validatePassword()"></td>
                    </tr>
                    <tr>
                        <td colspan="3" id="passwordMessage"></td>
                    </tr>
                    <tr>
                        <th>휴대폰 번호</th>
                        <td colspan="6" class="email-container">
                            <div id="td-div">
                                <span id="phone-prefix">010</span>
                                <span>-</span>
                                <input type="text" id="phone-suffix1" name="phone-middle">
                                <span>-</span>
                                <input type="text" id="phone-suffix2" name="phone-end">
                                <td colspan="1"><input type="button" class="check_button" value="인증번호 전송" onclick="sendPhoneNumber()"></td>
                            </div>
                        </td>
                    </tr>                    
                    <tr>
                        <th></th>
                        <td><input type="text"></td>
                        <td><input type="button" class="check_button" value="인증확인"></td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td class="email-container">
                            <input type="date" name="userDate">
                        </td>   
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="6" class="email-container">
                            <div style="display: flex;">
                                <input type="text" id="email-prefix" name="email-input">
                                <span id="email-prefix-shift2">@</span>
                                <input type="text" id="email-suffix" placeholder="직접 입력" name="email-text">
                            </div>
                        </td>
                        <td>
                            <select class="box" id="email-domain-list">
                                <option value="type">직접 입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
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
                        <td colspan="2"><input type="text" id="addressInput" name="address-input"></td><!-- 주소 입력란 -->
                        <td><input type="button" class="check_button" value="우편번호" onclick="openPostalCodePopup()"></td> <!-- 우편번호 버튼 -->
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="1"><input type="text" id="detailAddressInput" placeholder="자세한주소" name="address-detail"></td>
                        <td><input type="button" class="check_button" value="확인" onclick="checkAddress()"></td><!--확인용-->
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
                            <input type="text" name="genreLike" id="genreLike"> <!--button들 내용 추가-->
                        </td>
                    </tr>
                </table>
            </div>
            <div class="insert-member-div">
                <button type="button" id="backButton">이전</button>
                <button type="submit">다음</button>
            </div>
        </form>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>   
</body>
</html>