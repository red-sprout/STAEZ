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
    <link rel="stylesheet" href="${contextPath}/resources/css/user/idListForm.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>아이디찾기결과</title>
</head>
<body onload="init()">
    <main>
        <a href="${contextPath}/index.jsp"><img src="${contextPath}/resources/img/user/STAEZ_logo.png" alt="STAEZ로고"></a>
        <h2>아이디 찾기</h2>
        <p>회원님의 아이디 입니다</p>
        <!-- <div id="findId-div">
            <input type="checkbox" id="IdList"> 
            <label for="IdList"><h3>고객님의 1번째 아이디</h3></label>
        </div>
        <div id="findId-div">
            <input type="checkbox" id="IdList"> 
            <label for="IdList"><h3>고객님의 2번째 아이디</h3></label>
        </div>
        <div class="insert-member-div">
            <button type="submit">로그인</button>
            <button type="submit" style="min-width: 100px;">비밀번호 찾기</button>
        </div> -->

        <!-- 다수의 아이디 리스트를 보여주기 위한 반복문 -->
        <c:forEach var="userId" items="${userIdList}">
            <div class="findId-div">
                <input type="checkbox" class="idListCheckbox" id="${userId.id}"> 
                <label for="${userId.id}"><h3>${userId.name}</h3></label>
            </div>
        </c:forEach>
        
        <div class="insert-member-div">
            <button type="button" id="loginButton">로그인</button>
            <button type="submit" style="min-width: 100px;" id="pwdButton">비밀번호 찾기</button>
        </div>
    </main>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var checkboxes = document.querySelectorAll('.idListCheckbox');

            // 각 체크박스에 change 이벤트 리스너 추가
            checkboxes.forEach(function(checkbox) {
                checkbox.addEventListener('change', function() {
                    // 다른 체크박스를 해제
                    if (this.checked) {
                        checkboxes.forEach(function(otherCheckbox) {
                            if (otherCheckbox !== checkbox) {
                                otherCheckbox.checked = false;
                            }
                        });
                    }
                });
            });
        });

        // 로그인 버튼 눌렀을때
    document.addEventListener('DOMContentLoaded', function() {
        var loginButton = document.getElementById('loginButton');
        loginButton.addEventListener('click', function() {
            window.location.href = '${contextPath}/loginForm.me';
        });
    });

    // 비밀번호 버튼 눌렀을때
    document.addEventListener('DOMContentLoaded', function() {
        var loginButton = document.getElementById('pwdButton');
        loginButton.addEventListener('click', function() {
            window.location.href = '${contextPath}/findPwdForm.me';
        });
    });
    </script>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>
