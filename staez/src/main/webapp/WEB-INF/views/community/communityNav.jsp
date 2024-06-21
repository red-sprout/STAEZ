<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/community/communityMain.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="<c:url value='/resources/js/api/communityapi.js'/>"></script>
<script src="<c:url value='/resources/js/community/communityNav.js'/>"></script>
</head>
<body>
    <ul id="community-nav" align="left" onclick="navEvent(event)"></ul>
</body>
</html>