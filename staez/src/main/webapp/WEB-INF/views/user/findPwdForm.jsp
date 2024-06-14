<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/user/findPwd.css">
    <!-- Bootstrap 4 Tutorial -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
    <title>비밀번호 찾기</title>
</head>
<body onload="init()">
    <header>
        <!-- js -->
        <script src="${contextPath}/resources/js/api/userapi.js"></script>
        <script src="${contextPath}/resources/js/user/findPwdForm.js"></script>
    </header>
    <main>
        <a href="${contextPath}/index.jsp"><img src="${contextPath}/resources/img/user/STAEZ_logo.png" alt="STAEZ로고"></a>
        <h2>비밀번호 찾기</h2>
        <form id="checkFindNewPwd" action="checkFindNewPwd.me" method="post">
            <div id="findId-div">
                <table>
                    <tr>
                        <th>아이디</th>
                        <td  class="email-container">
                            <input type="text" id="input-value-id" name="userId" required>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td colspan="1">
                            <input type="text" name="user_name" id="user_name"  required >
                        </td>
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
                            <td>
                                <input type="button" id="phoneCheckButton" class="check_button" value="인증번호 전송">
                            </td>
                        </tr>
                        <tr id="verificationPhoneTr">
                            <td colspan="4">
                                <div id="verificationPhone" class="checkResult">
                                    <span id="Pverification-message"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>인증번호</th>
                            <td>
                                <div id="phoneTimeContainer">
                                    <input type="text" id="Pverification-code" required>
                                    <div id="Ptimer"></div>
                                </div>
                            </td>
                            <td>
                                <input type="button" class="check_button" id="check_PhoneSecretBtn" value="인증확인">
                            </td>
                        </tr>
                        <tr id="checkResultPhoneTr">
                            <td colspan="4">
                                <div id="checkResultPhone" class="checkResult">
                                    <span id="userPhoneErrorMessage"></span>
                                </div>
                            </td>
                        </tr>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="6" class="email-container" id="insertEmail" name="insertEmail">
                            <div id="td-div">
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
                        <td>
                            <input type="button" id="emailCheckButton" class="check_button" value="인증번호 전송">
                        </td>
                    </tr>
                    <tr id="verificationEmailTr">
                        <td colspan="4">
                            <div id="verificationEmail" class="checkResult">
                                <span id="verification-message"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>인증번호</th>
                        <td>
                            <div id="emailTimeContainer">
                                <input type="text" id="verification-code" required>
                                <div id="timer"></div>
                            </div>
                        </td>
                        <td>
                            <input type="button" class="check_button" id="check_emailSecretBtn" value="인증확인">
                        </td>
                    </tr>
                    <tr id="checkResultEmailTr">
                        <td colspan="4">
                            <div id="checkResultEmail" class="checkResult">
                                <span id="userEmailErrorMessage"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="insert-member-div">
                                <button type="button" id="backButton">이전</button>
                                <button type="button" id="findEmailCheck" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="clickIdPhoneEmail()" disabled>다음</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="container">
                <!-- The Modal -->
                <div class="modal" id="myModal">
                  <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">새로운 비밀번호를 입력하세요.</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                      
                        <!-- Modal body -->
                        <div id="emailNewPwd" class="modal-body">
                            <table id="findId-div">
                                <tr>
                                    <th colspan="2" class="findId-label">새 비밀번호</th>
                                    <td colspan="5">
                                        <div style="position: relative;">
                                            <input type="password" class="password1" id="newPassword" name="newPassword">
                                            <img src="${contextPath}/resources/img/user/pwd.png" id="pwdImg" alt="비밀번호 보기">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" class="findId-label">새 비밀번호 확인</th>
                                    <td colspan="5"><input type="password" id="confirmNewPassword" name="confirmNewPassword"></td>
                                </tr>
                            </table>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" id="loginButton" class="btn btn-danger" onclick="clickNewPwd()">변경하기</button>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
        </form>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>