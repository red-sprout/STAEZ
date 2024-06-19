<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                <th id="reserve-info">예매정보</th>
            </tr>

            <c:forEach var="c" items="${clist}">
            <tr class="tb-content">
                <td>
                    <img src="${contextPath}${c.filePath}${c.changeName}" onclick="location.href='${contextPath}/detail.co?concertNo=${c.concertNo}'">
                </td>
                <td class="concert-info">
                    <h3 onclick="location.href='${contextPath}/detail.co?concertNo=${c.concertNo}'">${c.concertTitle}</h3>
                    <h5>${c.theaterName}</h5>
                    <h4>
                        <fmt:formatDate value="${c.concertDate}" pattern="yyyy-MM-dd(E)" />
                        ${c.schedule} (${c.concertRuntime}분)
                    </h4>
                </td>
                <td class="reserve-info">
                    <h5>예약번호 : ${c.reserveNo}</h5>
                    <h5>
                        결제방식 : ${c.payMethod}
                    </h5>
                    <h5>                        
                        가격 : <fmt:formatNumber value="${c.price}" pattern="#,###￦" />
                    </h5>
                    <h5>
                        좌석 : ${c.grade}석
                        <c:set var="row" value="${c.reserveRow}" />
                        <c:set var="alphabet" value="${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', row - 1, row)}" />
                        <c:out value="${alphabet}" />${c.reserveCol}
                    </h5>
                    
                    <h5>
                        예약시간 : <fmt:formatDate value="${c.reserveDate}" pattern="yyyy-MM-dd HH:mm" />
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