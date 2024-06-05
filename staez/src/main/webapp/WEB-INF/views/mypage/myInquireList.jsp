<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myInquireList.css">
<script src="${contextPath}/resources/js/mypage/myInquireList.js"></script>
<script src="${contextPath}/resources/js/api/mypageapi.js"></script>

<div class="main-content">
    <div class="section-title">문의</div>

    <div class="main-title">
        <h2>1:1 문의내역</h2>
    </div>

    <div id="inq-section">
        <ul>
            <c:forEach var="b" items="${blist}">
            <li class="menu-item">
                <div class="inq-info">
                    <span class="inq-cate">${b.categoryName}</span>
                    <span class="inq-title">${b.boardTitle}</span>
                    <span class="inq-date"><fmt:formatDate value="${b.boardWriteDate}" pattern="yyyy-MM-dd" /></span>
                    <img src="${contextPath}/resources/img/inquire/up.png">
                </div>
                <div class="fold-content hidden">
                    <div class="inquire">
                        <p class="fold-title"><h3>문의내용</h3></p>
                        <p class="fold-content">${b.boardContent}</p>
                    </div>
                    <hr>
                    <div class="answer">
                        <input type="hidden" value="${b.boardNo}" name="inquireBoardNo">
                        <p class="fold-title"><h3>답변내용</h3></p>
                        <p class="fold-content"></p> <!--답변이 null 일 경우 '답변을 기다리는 중입니다.'-->
                        <p class="fold-answer-date"></p>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
    <div id="inq-enroll-btn">
        <a href="${contextPath}/insertForm.iq"><h3>문의하기</h3></a>
    </div>


    <div class="page-list">
        <c:if test="${pi.listCount != 0}">
            <c:if test="${pi.currentPage != 1}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/before.png" 
                         onclick='location.href="${contextPath}/inquireList.me?cpage=${pi.currentPage - 1}"'>
                </div>
            </c:if>
            
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${pi.currentPage eq i}">
                        <div class="pagination current" onclick="location.href='${contextPath}/inquireList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:when>
                    <c:otherwise>
                        <div class="pagination" onclick="location.href='${contextPath}/inquireList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${pi.currentPage ne pi.maxPage}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/after.png" 
                         onclick='location.href="${contextPath}/inquireList.me?cpage=${pi.currentPage + 1}"'>
                </div>
            </c:if>
        </c:if>
    </div>

</div>