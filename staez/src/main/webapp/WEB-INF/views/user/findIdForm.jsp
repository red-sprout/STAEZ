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
        <form action="">
            <div id="find-div">
                <input type="checkbox" id="phone-auth"> 
                <label for="phone-auth"><h3>회원정보에 등록한 휴대전화로 인증</h3></label>
            </div>
            <div id="findId-div">
                <table>
                    <tr>
                        <th colspan="2" class="findId-label">이름</th>
                        <td colspan="5"><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <th colspan="2" class="findId-label">휴대 번호</th>
                        <td colspan="1"><input type="number" placeholder=""></td>
                        <td colspan="1">-</td>
                        <td colspan="1"><input type="number"></td>
                        <td colspan="1">-</td>
                        <td colspan="1"><input type="number"></td>
                        <td colspan="1"><input type="button" class="check_button" value=" 인증번호 전송 "></td>
                    </tr>
                    <tr>
                        <th colspan="2" class="findId-label">인증 번호</th>
                        <td colspan="4"><input type="text" name="verification"></td>
                        <td colspan="1"><input type="button" class="check_button" value="확인"></td>
                        <td colspan="1"><input type="button" class="check_button" value="재발송"></td>
                    </tr>
                </table>
            </div>
            <br>
            <hr>
            <br>
            <div id="find-div">
                <input type="checkbox" id="phone-auth"> 
                <label for="phone-auth"><h3>이메일정보에 등록한 이메일로 인증</h3></label>
            </div>
            <div id="findId-div">
                <table>
                    <tr>
                        <th colspan="2" class="findId-label">이름</th>
                        <td colspan="5"><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <th colspan="2" class="findId-label">이메일</th>
                        <td colspan="1"><input type="text" placeholder=""></td>
                        <td colspan="1"></td>
                        <td colspan="1">@</td>
                        <td colspan="1"></td>
                        <td colspan="1"><input type="text"></td>
                        <td colspan="1"><input type="button" class="check_button" value=" 인증번호 전송 "></td>
                    </tr>
                    <tr>
                        <th colspan="2" class="findId-label">인증 번호</th>
                        <td colspan="4"><input type="text" name="verification"></td>
                        <td colspan="1"><input type="button" class="check_button" value="확인"></td>
                        <td colspan="1"><input type="button" class="check_button" value="재발송"></td>
                    </tr>
                </table>
                <br>
            </div>
        </form>
        <div class="insert-member-div">
            <button type="{main/jsp}">이전</button>
            <button type="submit">다음</button>
        </div>
    </main>
 
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>