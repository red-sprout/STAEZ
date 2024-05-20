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
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body>
    <div align="center">
        <div class="footer">
            <div class="footer-top">
                <div class="footer-nav">
                    <span>회사소개</span>
                    <img class="stick" src="${contextPath}/resources/img/common/footer/divide.png" alt="">
                    <span>이용약관</span>
                    <img class="stick" src="${contextPath}/resources/img/common/footer/divide.png" alt=""> 
                    <span>공지사항</span>
                    <img class="stick" src="${contextPath}/resources/img/common/footer/divide.png" alt="">
                    <span>고객센터</span>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="footer-content-area">
                    <div class="footer-content" align="left">
                        <span>(주)STAEZ</span>
                        <p>주소 서울시 서울 강남구 테헤란로14길 6 남도빌딩 3층</p>
                        <p>&nbsp조장관리 : 김효영&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDB관리 : 이원기</p>
                        <p>&nbsp형상관리 : 장용준&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이슈관리 : 김남주 </p>
                        <p>&nbsp일정관리 : 주재완</p>
                    </div>
                    <div class="footer-content" align="left">
                        <span>고객센터</span>
                        <p>티켓 1544-1555</p>
                        <p>팩스 02-830-7807</p>
                        <p>해외항공 02-3479-4399 | 국내항공 02-3479-4340</p>
                        <p>고객센터 이메일 helpdesk@staez.com</p>
                    </div>
                    <div class="footer-content" align="left">
                        <span>전자금융거래 분쟁처리 담당</span>
                        <p>티켓 1544-1555</p>
                        <p>팩스 02-830-8295</p>
                        <p>개인정보보호책임자 cpo@staez.com</p>
                        <p>전자 금융 거래이메일 intersolution@staez.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>