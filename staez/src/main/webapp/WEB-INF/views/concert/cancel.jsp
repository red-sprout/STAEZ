<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/concert/concertReserveLastStep.css">
<title>Insert title here</title>
</head>
<body>
    
	<div class="container">

	</div>
    <script src="${contextPath}/resources/js/api/concertReserveapi.js"></script>
    <script>
        window.onload = function(){
            alert("예매를 취소하셨습니다")
            window.close();
        }

    
    </script>
    
</body>
</html>