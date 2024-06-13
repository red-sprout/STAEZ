<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/chatbot/chatbot.css'/>">
</head>
<body>
    <button id="chatbot-button" onclick="chatModalToggle()">
        <img src="<c:url value='/resources/img/common/chatbot.png'/>">
    </button>
    <input type="hidden" id="genre" value="${loginUser.genreLike}" /><br>
    <div id="chatbot-modal" class="hidden">
        <div id="chatbot-modal-title">
            <h2>음악 추천 챗봇</h2>
        </div>
        <div id="chatbot-modal-content">
        </div>
        <div id="chatbot-modal-input">
            <label for="preferences"></label>
            <textarea id="preferences" rows="4" cols="50" placeholder="AI가 여러분들의 설명을 통해 추천곡을 5개 찾아드립니다!"></textarea>
            <button onclick="getRecommendation()"><h3>입력</h3></button>
        </div>
    </div>
    <script src="<c:url value='/resources/js/chatbot/config.js'/>"></script>
    <script src="<c:url value='/resources/js/chatbot/chatbot.js'/>"></script>
</body>
</html>