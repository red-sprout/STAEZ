<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/likeBoardList.css">

<div class="main-content">
    <div class="section-title">커뮤니티 관리</div>

    <div class="main-title">
        <h2>좋아요</h2>
    </div>
    <table>
        <tbody>
            <tr class="col-name">
                <th id="board-title">제목</th>
                <th id="writer">작성자</th>
                <th id="enroll-date">작성일</th>
                <th id="views">조회수</th>
                <th id="likes">좋아요</th>
            </tr>
            <c:forEach var="b" items="${blist}">
            <tr class="tb-content" onclick="location.href='detail.cm?boardNo=${b.boardNo}'">
                <td class="btitle">${b.boardTitle}</td>
                <td>${b.nickname}</td>
                <td>
                    <fmt:parseDate value="${b.boardWriteDate}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />
                    <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
                </td>
                <td>${b.boardCount}</td>
                <td>${b.likeCount}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="page-list">
        <c:if test="${pi.listCount != 0}">
            <c:if test="${pi.currentPage != 1}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/before.png" 
                         onclick='location.href="${contextPath}/likeList.me?cpage=${pi.currentPage - 1}"'>
                </div>
            </c:if>
            
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${pi.currentPage eq i}">
                        <div class="pagination current" onclick="location.href='${contextPath}/likeList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:when>
                    <c:otherwise>
                        <div class="pagination" onclick="location.href='${contextPath}/likeList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${pi.currentPage ne pi.maxPage}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/after.png" 
                         onclick='location.href="${contextPath}/likeList.me?cpage=${pi.currentPage + 1}"'>
                </div>
            </c:if>
        </c:if>
    </div>

</div>
