<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/paymentsLog.css">
<script src="${contextPath}/resources/js/mypage/paymentsLog.js"></script>

<div class="main-content">
    <div class="main-title">
        <h2>결제내역</h2>
    </div>
    <table>
        <tbody>
            <tr class="tb-title">
                <th>예매번호</th>
                <th>공연정보</th>
                <th>예매정보</th>
            </tr>
            <c:if test="${empty clist}">
                <tr class="tb-content">
                    <td colspan="3"> 결제내역이 없습니다</td>
                </tr>
            </c:if>

            <c:forEach var="c" items="${clist}">
            <tr class="tb-content">
                <td class="reserve-no">
                    <h5>${c.reserveNo}</h5>
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
                    <input type="hidden" name="reserveNo" value="${c.reserveNo}">
                    <h5>
                        결제방식 : ${c.payMethod}
                    </h5>
                    <h5 class="seat-no">
                        <input type="hidden" name="row" value="${c.reserveRow}">
                        <input type="hidden" name="col" value="${c.reserveCol}">
                        <input type="hidden" name="seat" value="${c.grade}">
                    </h5>
                    
                    <h5>
                        예매시간 : <fmt:formatDate value="${c.reserveDate}" pattern="yyyy-MM-dd HH:mm" />
                    </h5>
                    <c:if test="${c.reserveStatus eq 'Y'}">
                        <button class="btn-staez">결제 완료</button>
                    </c:if>
                    <c:if test="${c.reserveStatus eq 'U'}">
                        <button class="btn-staez checked">결제대기중</button>
                    </c:if>
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