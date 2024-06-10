<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/adminHeader.css'/>">
</head>
<body>
    <div id="admin-header-wrapper">
        <div id="admin-header-nav">
            <ul id="admin-header-flex">
                <li onclick="location.href='userList.ad'"><h2>이용자</h2></li>
                <li onclick="location.href='concertList.ad'"><h2>공연</h2></li>
                <li onclick="location.href='theaterList.ad'"><h2>공연장</h2></li>
                <li onclick="location.href='communityList.ad'"><h2>커뮤니티</h2></li>
                <li onclick="location.href='reserveList.ad'"><h2>예약내역</h2></li>
                <li onclick="location.href='faqList.ad'"><h2>FAQ</h2></li>
                <li onclick="location.href='inquireList.ad'"><h2>문의</h2></li>
                <li onclick="location.href='reportList.ad'"><h2>신고</h2></li>
            </ul>
        </div>
        <!-- <ul>
            <li><h2>이용자</h2></li>
            <li><h2>공연</h2></li>
            <li><h2>공연장</h2></li>
            <li><h2>커뮤니티</h2></li>
            <li><h2>카테고리</h2></li>
            <li><h2>FAQ</h2></li>
            <li><h2>문의</h2></li>
            <li><h2>신고</h2></li>
        </ul> -->
    </div>
</body>
</html>