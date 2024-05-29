<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/paymentsLog.css">

<div class="main-content">
    <div class="main-title">
        <h2>결제내역</h2>
    </div>
    <table>
        <tbody>
            <tr class="tb-title">
                <th colspan="2" id="concert-info">공연정보</th>
                <th id="reserve-info">예약정보</th>
            </tr>


            <c:forEach var="i" begin="0" end="4">
            <tr class="tb-content">
                <td>
                    <img src="${contextPath}/resources/img/mypage/chicago.gif" alt="">
                </td>
                <td id="content">
                    <h3>꽃 별이지나</h3>
                    <h5>서경대학교 공연예술센터 스콘 1관</h5>
                    <h4>2024.04.15 (수) 15:00 (100분)</h4>
                </td>
                <td>
                    <h5>
                        예약번호: 123124 <br>
                        2024.04.01 <br>
                        2매 200,000￦
                    </h5>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="page-list">
        <c:if test="${pi.listCount != 0}">
            <c:if test="${pi.currentPage != 1}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/before.png" 
                         onclick='location.href="${contextPath}/paymentList.me?cpage=${pi.currentPage - 1}"'>
                </div>
            </c:if>
            
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${pi.currentPage eq i}">
                        <div class="pagination current" onclick="location.href='${contextPath}/paymentList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:when>
                    <c:otherwise>
                        <div class="pagination" onclick="location.href='${contextPath}/paymentList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${pi.currentPage ne pi.maxPage}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/after.png" 
                         onclick='location.href="${contextPath}/paymentList.me?cpage=${pi.currentPage + 1}"'>
                </div>
            </c:if>
        </c:if>
    </div>

</div>