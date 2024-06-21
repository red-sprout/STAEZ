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
        <div id="load"></div>
        <input type="hidden" name="userNo" value="${userNo}">
        <input type="hidden" name="concertNo" value="${concertNo}">
        <input type="hidden" name="recipientName" value="${recipientName}">
        <input type="hidden" name="recipientPhone" value="${recipientPhone}">
        <input type="hidden" name="recipientBirth" value="${recipientBirth}">
        <input type="hidden" name="recipientEmail" value="${recipientEmail}">
        <input type="hidden" name="payMethod" value="${payMethod}">
        <input type="hidden" name="concertDate" value="${concertDate}">
        <input type="hidden" name="schedule" value="${schedule}">
        <input type="hidden" name="seatList" value='${seatList}'>
        <input type="hidden" name="totalAmount" value='${totalAmount}'>

	</div>
    <script src="${contextPath}/resources/js/api/concertReserveapi.js"></script>
    <script>
        function showLoading(){
            const loadingPage = document.getElementById('load');
             loadingPage.innerHTML = `<img src="/staez/resources/img/concert/loading.gif" alt="loading">`;
        };

        window.onload = function(){
            showLoading();
            const userNo = document.querySelector("input[name = 'userNo']").value;
            const concertNo = document.querySelector("input[name = 'concertNo']").value;
            const recipientName = document.querySelector("input[name = 'recipientName']").value;
            const recipientPhone = document.querySelector("input[name = 'recipientPhone']").value;
            const recipientBirth = document.querySelector("input[name = 'recipientBirth']").value;
            const recipientEmail = document.querySelector("input[name = 'recipientEmail']").value;
            const payMethod = document.querySelector("input[name = 'payMethod']").value;
            const concertDate =  document.querySelector("input[name = 'concertDate']").value; 
            const schedule = document.querySelector("input[name = 'schedule']").value;
            const totalAmount = document.querySelector("input[name='totalAmount']").value;  
            const seatListStr = document.querySelector("input[name='seatList']").value;
            const seatList = JSON.parse(seatListStr);
           
            const rids = JSON.stringify({
                    userNo,
                    concertNo,
                    recipientName,
                    recipientPhone,
                    recipientBirth,
                    recipientEmail,
                    payMethod,
                    concertDate,
                    schedule,
                    seatList,
                    totalAmount
                })
                ajaxinsertReserve({rids},(res) => alertAndClose(res))
        }
        
        function alertAndClose(res){
            console.log(res)
            if(res === "good"){
                alert("예매에 성공하셨습니다.")
                window.close()
            } else {    
                alert("예매를 실패하였습니다.")
                window.close()
            }
        }
    
    </script>

    <style>
    #load {
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        position: fixed;
        display: block;
        background: white;
        z-index: 99;
        text-align: center;
    }

    #load > img {
        position: absolute;
        top: 50%;
        left: 50%;
        z-index: 100;
  }
    </style>
    
</body>
</html>