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
    <script src="${contextPath}/resources/js/user/insertPwdForm.js"></script>
    <title>비밀번호 변경</title>
</head>
<body>
    <main>
        <a href="${contextPath}/index.jsp"><img src="${contextPath}/resources/img/user/STAEZ_logo.png" alt="STAEZ로고"></a>
        <h2>비밀번호 변경</h2>
        <form action="">
            <div id="findId-div">
                <table>
                    <tr>
                        <th colspan="2" class="findId-label">새 비밀번호</th>
                        <td colspan="5"><input type="password" id="newPassword" name="newPassword"></td>
                    </tr>
                    <tr>
                        <th colspan="2" class="findId-label">새 비밀번호 확인</th>
                        <td colspan="5"><input type="password" id="confirmNewPassword" name="confirmNewPassword"></td>
                    </tr>
                </table>
            </div>
        </form>

        <div class="insert-member-div">
            <!-- Button to Open the Modal -->
            <button type="button" id="changeButton">변경</button>

            <!-- The Success Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">비밀번호 변경 성공!</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">비밀번호 변경에 성공하셨습니다!</div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="window.location.href = 'loginForm.me'">로그인</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                        </div>
                        
                    </div>
                </div>
            </div>

            <!-- The Failure Modal -->
            <div class="modal fade" id="failureModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">비밀번호 변경 실패!</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">비밀번호가 일치하지 않습니다.</div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>
