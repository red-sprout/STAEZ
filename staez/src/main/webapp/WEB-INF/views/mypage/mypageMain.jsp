<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageMain.css">
<script src="${contextPath}/resources/js/mypage/mypageMain.js"></script>


       
<div class="main-content">
    <div id="reserve-td">
        <div class="table-title">최근 예매내역</div>
        <table>
            <tr>
                <th id="reserve-date">예매일</th>
                <th id="reserve-no">예약번호</th>
                <th id="concert-title">공연명</th>
                <th id="watch-date">관람일</th>
                <th id="ticket-amount">매수</th>
            </tr>
            <c:forEach var="i" begin="0" end="4">
                <tr>
                    <td>24.04.04</td>
                    <td>11111111</td>
                    <td align="left">꽃 별이지나</td>
                    <td>24.04.16</td>
                    <td>2</td>
                </tr>
            </c:forEach>
        </table>
        <div class="more-btn"><a href="${contextPath}/paymentList.me?cpage=1">더보기</a></div> 
    </div>

    <div id="like-and-review">
        <div id="like">
            <div class="table-title">최근 찜목록</div>
            <table>
                <c:forEach var="i" begin="0" end="4">
                <tr>
                    <td class="long-td">2024 최현우 Answer - 여수</td>
                    <td>24.04.01</td>
                </tr>
                </c:forEach>
            </table>
            <div class="more-btn"><a href="${contextPath}/scrapList.me?cpage=1">더보기</a></div> 
        </div>
        <div id="review">
            <div class="table-title">한줄평</div>
            <table>
                <c:forEach var="i" begin="0" end="4">      
                <tr>
                    <td class="long-td">2024 최현우 Answer - 여수</td>     
                    <td>★ 5</td>
                </tr>
                </c:forEach>
            </table>
            <div class="more-btn"><a href="${contextPath}/reviewList.me?cpage=1">더보기</a></div> 
        </div>
        
    </div>
    <div id="community-manage">
        <div class="section-title">커뮤니티 관리</div>
        <div>
            <div id="my-board">
                <div class="table-title">
                    나의 게시글
                    <button onclick="location.href='${contextPath}/incertForm.cm'">+</button>
                </div>
                <table>
                    <c:forEach var="i" begin="0" end="4">      
                    <tr>
                        <td class="long-td">〈웨스턴 스토리〉재밌어요</td>     
                        <td>24.04.01</td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="more-btn"><a href="${contextPath}/boardList.me?cpage=1">더보기</a></div> 
            </div>
            <div id="my-inquire">
                <div class="table-title">
                    문의내역
                    <button onclick="location.href='${contextPath}/insertForm.iq'">+</button>
                </div>
                <table>
                    <c:forEach var="i" begin="0" end="4">      
                    <tr>
                        <td class="long-td">환불 가능할까요?</td>     
                        <td class="short-td">24.04.01</td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="more-btn"><a href="${contextPath}/inquireList.me?cpage=1">더보기</a></div> 
            </div>
        </div>

    </div>
</div>
        

