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
    <link rel="stylesheet" href="${contextPath}/resources/css/user/findId.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/user/insertForm.css">
    <!-- Bootstrap 4 Tutorial -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>아이디찾기</title>
    <script type="text/javascript">
        var contextPath = '<%= request.getContextPath() %>';
    </script>
</head>
<body onload="init()">
    <header>
        <!-- js -->
        <script src="${contextPath}/resources/js/api/userapi.js"></script>
        <script src="${contextPath}/resources/js/user/findIdForm.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </header>
    <main>
        <a href="${contextPath}/index.jsp"><img src="${contextPath}/resources/img/user/STAEZ_logo.png" alt="STAEZ로고"></a>
        <h2>아이디 찾기</h2>
        <form id="idListPhoneForm" action="idListForm.me" method="POST">
            <div id="find-div-phone">
                <input type="checkbox" id="phone-auth"> 
                <label for="phone-auth"><h3>회원정보에 등록한 휴대전화로 인증</h3></label>
            </div>
            <div id="findphone-div">
                <table>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" id="user_name" required>
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
                                <input type="button" id="phoneCheckButton" class="check_button" value="인증번호 전송" onclick="phoneClick()">
                            </td>
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
                                <input type="button" class="check_button" id="check_PhoneSecretBtn" value="인증확인" onclick="checkAuthNum()">
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
                </table>
            </div>
        </form>
            <br>
            <hr>
            <br>
        <form id="idListEmailForm" action="idListForm.me" method="POST">
            <div id="find-div-email">
                <input type="checkbox" id="email-auth"> 
                <label for="email-auth"><h3>이메일정보에 등록한 이메일로 인증</h3></label>
            </div>
            <div id="findemail-div">
                <table>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" id="user_name" required>
                        </td>
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
                </table>
            </div>
        </form>
        <div class="insert-member-div">
            <button type="button" id="backButton">이전</button>
            <button type="submit" id="findEmailCheck" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="clickGetId()"disabled>다음</button>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
      
        <!-- The Modal -->
        <div class="modal" id="myModal">
          <div class="modal-dialog">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">회원님의 이메일에 등록된 아이디입니다.</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div id="emailFindId" class="modal-body">
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" id="loginButton" class="btn btn-danger" data-dismiss="modal">로그인</button>
                <button type="button" id="pwdFindButton" class="btn btn-danger" data-dismiss="modal">비밀번호 찾기</button>
              </div>
              
            </div>
          </div>
        </div>
      </div>
</body>
</html>

