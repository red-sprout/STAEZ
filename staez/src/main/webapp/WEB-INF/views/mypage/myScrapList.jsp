<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myScrapList.css">
<script src="${contextPath}/resources/js/mypage/myScrapList.js"></script>
<script src="${contextPath}/resources/js/api/mypageapi.js"></script>

<div class="main-content">
    <div class="main-title">
        <h2>찜목록</h2>
        <c:if test="${not empty clist}">
            <div>
                <button type="button" id="deleteBtn" class="btn-staez purple" onclick="deleteMyScrap()"><h4>선택삭제</h4></button>
                <input type="checkbox" id="checkAll">
            </div>
        </c:if>
    </div>
    <table>
        <tbody>
            <tr class="tb-title">
                <th colspan="3">공연정보</th>
            </tr>
            <c:if test="${empty clist}">
                <tr class="tb-content">
                    <td>찜공연이 없습니다</td>
                </tr>
            </c:if>
            
            <c:forEach var="c" items="${clist}">
            <tr class="tb-content">
                <td class="concert-img" onclick='location.href="${contextPath}/detail.co?concertNo=${c.concertNo}"'>
                    <c:set var="changeName" value="${c.changeName}" />
                    <c:set var="filePath" value="${c.filePath}" />
                    <c:choose>                        
                        <c:when test="${empty filePath && empty changeName}">
                            <img src="${contextPath}/resources/uploadfiles/concert/2024061812485286946.png"> <!--공연이미지가 없을 시 기본이미지-->
                        </c:when>
                        <c:otherwise>
                            <img src="${contextPath}${c.filePath}${c.changeName}">
                        </c:otherwise>
                    </c:choose>
                    <c:remove var="changeName" />
                    <c:remove var="filePath" />
                </td>
                <td class="concert-content" onclick='location.href="${contextPath}/detail.co?concertNo=${c.concertNo}"'>
                    <h3>${c.concertTitle}</h3>
                    <h4>캐스팅 : ${c.concertMembers}</h4>
                    <h4>상영기간 : ${c.startDate} ~ ${c.endDate}</h4>
                </td>
                <td class="age-checkbox">
                    <div>
                        <input type="checkbox" value="${c.concertNo}">
                    </div>
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