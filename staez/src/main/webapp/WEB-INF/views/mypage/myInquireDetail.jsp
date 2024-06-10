<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myInquireDetail.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="${contextPath}/resources/js/api/mypageapi.js"></script>
<script src="${contextPath}/resources/js/mypage/myInquireDetail.js"></script>

<title>Insert title here</title>
</head>

<body onload="init()">
    <main>
        <input type="hidden" id="contextPath" value="${contextPath}">
        <input type="hidden" name="boardNo" value="${inquire.boardNo}">
    
        <div id="inquire-section">
            <div class="header">
                <span class="category">
                    <h4>${inquire.categoryName}</h4>                    
                </span>
                <span class="title">
                    <h3>${inquire.boardTitle}</h3>
                </span>
            </div>
            <div class="content">
                ${inquire.boardContent}
            </div>
            <div class="date">
                <h5><fmt:formatDate value="${inquire.boardWriteDate}" pattern="yyyy-MM-dd HH:mm"/></h5>
            </div>
        </div>
        <div id="answer-section"></div>

        <button class="btn-staez" onclick="window.close()">닫기</button>
    </main>
</body>
</html>