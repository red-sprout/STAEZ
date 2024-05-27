<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/myInquireList.css">
<script src="${contextPath}/resources/js/mypage/myInquireList.js"></script>

<div class="main-content">
    <div class="section-title">문의</div>

    <div class="main-title">
        <h2>1:1 문의내역</h2>
    </div>

    <div id="inq-section">
        <ul>
            <c:forEach var="i" begin="0" end="7">
            <li class="menu-item">
                <div class="inq-info">
                    <span class="inq-cate">분류</span>
                    <span class="inq-title">환불 가능할까요?</span>
                    <span class="inq-date">2024-04-01</span>
                    <span class="folding-icon">▼</span>
                </div>
                <div class="fold-content hidden">
                    <div class="inquire">
                        <p class="fold-title"><h3>문의내용</h3></p>
                        <p>급한 사정이 생겨 예매 날짜에 가지 못하게됐습니다. 환불해주세요</p>
                    </div>
                    <hr>
                    <div class="answer">
                        <p class="fold-title"><h3>답변내용</h3></p>
                        <p>안됩니다</p> <!--답변이 null 일 경우 '답변을 기다리는 중입니다.'-->
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
        <div class="pagination">
            <img src="${contextPath}/resources/img/main/before.png">
        </div>
        <div class="pagination current"><h4>1</h4></div>
        <div class="pagination"><h4>2</h4></div>
        <div class="pagination"><h4>3</h4></div>
        <div class="pagination"><h4>4</h4></div>
        <div class="pagination"><h4>5</h4></div>
        <div class="pagination"><h4>6</h4></div>
        <div class="pagination"><h4>7</h4></div>
        <div class="pagination"><h4>8</h4></div>
        <div class="pagination"><h4>9</h4></div>
        <div class="pagination"><h4>10</h4></div>
        <div class="pagination">
            <img src="${contextPath}/resources/img/main/after.png">
        </div>
    </div>

</div>