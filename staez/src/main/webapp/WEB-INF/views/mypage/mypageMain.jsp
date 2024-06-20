<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageMain.css">
<script src="${contextPath}/resources/js/mypage/mypageMain.js"></script>


       
<div class="main-content">
    <div id="reserve-td">
        <div class="table-title">최근 예매 공연</div>
        <table>
            <thead>
                <tr>
                    <th id="reserve-time">예매시간</th>
                    <th id="concert-title">공연명</th>
                    <th id="watch-date">상연시간</th>
                    <th id="ticket-amount">매수</th>
                </tr>
            </thead>
            <tbody>
                    <!-- 최근 예매한 공연정보 (결제정보) 5개 -->
            </tbody>
        </table>
        <div class="more-btn"><a href="${contextPath}/paymentList.me?cpage=1">더보기</a></div> 
    </div>

    <div id="like-and-review">
        <div id="like">
            <div class="table-title">최근 찜목록</div>
            <table>
                <tbody>
                    <!-- 최근 찜한 공연 리스트 5개 -->
                </tbody>
            </table>
            <div class="more-btn"><a href="${contextPath}/scrapList.me?cpage=1">더보기</a></div> 
        </div>
        <div id="review">
            <div class="table-title">작성 한줄평</div>
            <table>
                <tbody>
                    <!-- 최근 작성한 한줄평 리스트 5개-->
                </tbody>
            </table>
            <div class="more-btn"><a href="${contextPath}/reviewList.me?cpage=1">더보기</a></div> 
        </div>
        
    </div>
    <div id="community-manage">
        <div id="my-board">
            <div class="table-title">
                최근 나의 작성글
                <button onclick="location.href='${contextPath}/insertForm.cm'">+</button>
            </div>
            <table>
                <tbody>
                    <!-- 최근 나의 작성글 5개 -->
                </tbody>
            </table>
            <div class="more-btn"><a href="${contextPath}/boardList.me?cpage=1">더보기</a></div> 
        </div>
        <div id="my-inquire">
            <div class="table-title">
                최근 문의내역
                <button onclick="location.href='${contextPath}/insertForm.iq?categoryNo=22'">+</button>
            </div>
            <table>
                <tbody>
                    <!-- 최근 나의 문의글 5개 -->
                </tbody>
            </table>
            <div class="more-btn"><a href="${contextPath}/inquireList.me?cpage=1">더보기</a></div> 
        </div>

    </div>
</div>
        

