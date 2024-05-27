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
            <c:forEach var="i" begin="0" end="9">
            <tr class="tb-content">
                <td id="btitle">가나다라마바사아자차카타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후</td>
                <td>사람1</td>
                <td>24.02.28</td>
                <td>356</td>
                <td>43</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

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
