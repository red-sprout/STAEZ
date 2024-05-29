<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myScrapList.css">

<div class="main-content">
    <div class="main-title">
        <h2>찜목록</h2>
    </div>

    <table>
        <tbody>
            <tr class="tb-title">
                <th colspan="3">공연정보</th>
            </tr>

            <c:forEach var="c" items="${clist}">
            <tr class="tb-content">
                <td id="concert-img">
                    <img src="${contextPath}${c.filePath}${c.changeName}" alt="">
                </td>
                <td id="content">
                    <h3>${c.concertTitle}</h3>
                    <h5>${c.theaterName}</h5>
                    <h4>캐스팅 : ${c.concertMembers}</h4>
                    <h4>상영기간 : ${c.startDate} ~ ${c.endDate}</h4>
                </td>
                <td id="age-limit">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>${c.ageLimit}</h4>
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
                         onclick='location.href="${contextPath}/scrapList.me?cpage=${pi.currentPage - 1}"'>
                </div>
            </c:if>
            
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${pi.currentPage eq i}">
                        <div class="pagination current" onclick="location.href='${contextPath}/scrapList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:when>
                    <c:otherwise>
                        <div class="pagination" onclick="location.href='${contextPath}/scrapList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${pi.currentPage ne pi.maxPage}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/after.png" 
                         onclick='location.href="${contextPath}/scrapList.me?cpage=${pi.currentPage + 1}"'>
                </div>
            </c:if>
        </c:if>
    </div>

</div>