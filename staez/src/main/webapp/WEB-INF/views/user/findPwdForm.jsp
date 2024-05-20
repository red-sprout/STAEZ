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
    <link rel="stylesheet" href="${contextPath}/resources/css/user/findPwd.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>비밀번호 찾기</title>
</head>
<body onload="init()">
    <main>
        <a href="${contextPath}/index.jsp"><img src="${contextPath}/resources/img/user/STAEZ_logo.png" alt="STAEZ로고"></a>
        <h2>비밀번호 찾기</h2>
        <form action="">
            <div id="findId-div">
                <table>
                    <tr>
                        <th colspan="2" class="findId-label">아이디</th>
                        <td colspan="5"><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <th colspan="2" class="findId-label">이메일</th>
                        <td colspan="2"><input type="text" placeholder=""></td>
                        <td colspan="1" >@</td>
                        <td colspan="2"><input type="text"></td>
                        <td>
							<select class="box" id="domain-list">
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