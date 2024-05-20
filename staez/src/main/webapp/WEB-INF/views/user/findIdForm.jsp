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
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/user/findId.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>아이디찾기</title>
</head>
<body onload="init()">
    <main>
        <a href="${contextPath}/index.jsp"><img src="${contextPath}/resources/img/user/STAEZ_logo.png" alt="STAEZ로고"></a>
        <h2>아이디 찾기</h2>
        <form id="register-form" action="register.php" method="POST">
            <!-- 
                id="register-form"은 폼을 식별하는 고유한 ID입니다. 
                action="register.php"은 폼 데이터가 제출될 때 이동할 페이지를 지정합니다. 
                method="POST"는 데이터를 서버로 전송하는 방법 
            -->
            <div id="find-div-phone">
                <input type="checkbox" id="phone-auth"> 
                <label for="phone-auth"><h3>회원정보에 등록한 휴대전화로 인증</h3></label>
            </div>
            <div id="findphone-div">
                <table>
                    <tr>
                        <th colspan="4" class="findId-label">이름</th>
                        <td colspan="5"><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <th colspan="4" class="findId-label">휴대 전화</th>
                        <td colspan="1">
                            <select name="phone-prefix" id="phone-select">
                                <option value="010" selected>010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                        </td>
                        <td colspan="1">-</td>
                        <td colspan="1"><input type="text" id="phone-mid" name="phone-mid"></td>
                        <td colspan="1">-</td>
                        <td colspan="1"><input type="text" id="phone-end" name="phone-end"></td>
                        <td colspan="1"><input type="button" class="check_button" value=" 인증번호 전송 "></td>
                    </tr>
                    <tr>
                        <th colspan="4" class="findId-label">인증 번호</th>
                        <td colspan="4"><input type="text" name="verification"></td>
                        <td colspan="1"><input type="button" class="check_button" value="확인"></td>
                        <td colspan="1"><input type="button" class="check_button" value="재발송"></td>
                    </tr>
                </table>
            </div>
            <br>
            <hr>
            <br>
            <div id="find-div-email">
                <input type="checkbox" id="email-auth"> 
                <label for="email-auth"><h3>이메일정보에 등록한 이메일로 인증</h3></label>
            </div>
            <div id="findemail-div">
                <table>
                    <tr>
                        <th colspan="4" class="findId-label">이름</th>
                        <td colspan="3"><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <th colspan="4" class="findId-label">이메일</th>
                        <td colspan="1"><input type="text" placeholder=""></td>
                        <td colspan="1">@</td>
                        <td colspan="1"><input type="text"></td>
                        <td colspan="1"><input type="button" class="check_button" value=" 인증번호 전송 "></td>
                    </tr>
                    <tr>
                        <th colspan="4" class="findId-label">인증 번호 </th>
                        <td colspan="2"><input type="text" name="verification"></td>
                        <td colspan="1"><input type="button" class="check_button" value="확인"></td>
                        <td colspan="1"><input type="button" class="check_button" value="재발송"></td>
                    </tr>
                </table>
            </div>
        </form>        
        <div class="insert-member-div">
            <button type="button" id="backButton">이전</button>
            <button type="submit">다음</button>
        </div>
    </main>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 페이지 로드 시 findId-div를 숨김
            var findPhoneDiv = document.getElementById('findphone-div');
            var findEmailDiv = document.getElementById('findemail-div');
            findPhoneDiv.style.display = 'none';
            findEmailDiv.style.display = 'none';
    
            // phone-auth 체크박스에 클릭 이벤트를 추가하여 내용을 보이도록 함
            var phoneAuthCheckbox = document.getElementById('phone-auth');
            var emailAuthCheckbox = document.getElementById('email-auth');
            
            phoneAuthCheckbox.addEventListener('change', function() {
                if (this.checked) {
                    // 체크박스가 체크되면 findId-div를 보이도록 함
                    findPhoneDiv.style.display = 'block';
                    findEmailDiv.style.display = 'none';
                    emailAuthCheckbox.checked = false;
                } else {
                    // 체크박스가 해제되면 findId-div를 숨김
                    findPhoneDiv.style.display = 'none';
                }
            });
    
            emailAuthCheckbox.addEventListener('change', function() {
                if (this.checked) {
                    // 체크박스가 체크되면 findId-div를 보이도록 함
                    findEmailDiv.style.display = 'block';
                    findPhoneDiv.style.display = 'none';
                    phoneAuthCheckbox.checked = false;
                } else {
                    // 체크박스가 해제되면 findId-div를 숨김
                    findEmailDiv.style.display = 'none';
                }
            });
        });

        // 이전페이지로 돌아가는
        document.addEventListener('DOMContentLoaded', function() {
        var backButton = document.getElementById('backButton');
        backButton.addEventListener('click', function() {
            window.history.back();
        });

        var loginButton = document.getElementById('loginButton');
        loginButton.addEventListener('click', function() {
            window.location.href = '${contextPath}/loginForm.jsp';
        });
    });

    // 아이디찾은 페이지로 가기위해
        document.addEventListener('DOMContentLoaded', function() {
        var submitButton = document.querySelector('button[type="submit"]');
        submitButton.addEventListener('click', function() {
            // 폼 데이터 수집
            var formData = {
                name: document.querySelector('input[name="name"]').value,
                phonePrefix: document.querySelector('select[name="phone-prefix"]').value,
                phoneMid: document.querySelector('input[name="phone-mid"]').value,
                phoneEnd: document.querySelector('input[name="phone-end"]').value,
                verification: document.querySelector('input[name="verification"]').value
            };

            // 쿼리 문자열 생성
            var queryString = Object.keys(formData).map(function(key) {
                return encodeURIComponent(key) + '=' + encodeURIComponent(formData[key]);
            }).join('&');

            // 다음 페이지 URL에 쿼리 문자열 추가하여 이동
            window.location.href = '${contextPath}/register.php?' + queryString;
        });
    });


    </script>
    
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>