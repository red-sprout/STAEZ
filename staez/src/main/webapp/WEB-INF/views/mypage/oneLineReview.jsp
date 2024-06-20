<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/oneLineReview.css">
<script src="${contextPath}/resources/js/mypage/oneLineReview.js"></script>

<div class="main-content">
    <div class="main-title">
        <h2>한줄평</h2>
    </div>
    <table>
        <tbody>
            <tr class="tb-title">
                <th colspan="3">공연정보</th>
            </tr>
            <c:if test="${empty clist}">
                <tr>
                    <td>관람한 공연이 없습니다</td>
                </tr>   
            </c:if>

            <c:forEach var="c" items="${clist}">
            <c:choose>
                <c:when test="${c.reviewStatus eq 'Y'}">
                    <tr>
                        <td class="concert-img"  onclick='location.href="${contextPath}/detail.co?concertNo=${c.concertNo}"'>
                            <img src="${contextPath}${c.filePath}${c.changeName}">
                        </td>
                        <td class="content">
                            <h3>${c.concertTitle}</h3>
                            <h5>최근 관람일 : ${c.concertDate}</h5>
                            <h4>${c.reviewContent}</h4>
                        </td>
                        <td class="review-func">
                            <span>
                                <img src="${contextPath}/resources/img/mypage/star-filled.png"> 
                                <h4>${c.score}</h4>
                            </span>
                            <button type="button" class="btn-staez purple" data-toggle="modal" data-target="#myModal" onclick="loadOneLineReview('${c.concertNo}')" hidden><h4>수정</h4></button>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td class="concert-img" onclick='location.href="${contextPath}/detail.co?concertNo=${c.concertNo}"'>
                            <img src="${contextPath}${c.filePath}${c.changeName}">
                        </td>
                        <td class="content">
                            <h3>${c.concertTitle}</h3>
                            <h5>최근 관람일 : ${c.concertDate}</h5>
                            <h4>(리뷰를 작성해주세요)</h4>
                        </td>
                        <td class="review-func">
                            <button type="button" class="btn-staez purple" data-toggle="modal" data-target="#myModal"  onclick="loadOneLineReview('${c.concertNo}')"><h4>후기작성</h4></button>
                        </td>
                    </tr>                    
                </c:otherwise>                
            </c:choose>            
        </c:forEach>
        </tbody>
    </table>

    <div class="page-list">
        <c:if test="${pi.listCount != 0}">
            <c:if test="${pi.currentPage != 1}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/before.png" 
                         onclick='location.href="${contextPath}/reviewList.me?cpage=${pi.currentPage - 1}"'>
                </div>
            </c:if>
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
                <c:choose>
                    <c:when test="${pi.currentPage eq i}">
                        <div class="pagination current" onclick="location.href='${contextPath}/reviewList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:when>
                    <c:otherwise>
                        <div class="pagination" onclick="location.href='${contextPath}/reviewList.me?cpage=${i}'"><h4>${i}</h4></div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${pi.currentPage ne pi.maxPage}">
                <div class="pagination">
                    <img src="${contextPath}/resources/img/main/after.png" 
                         onclick='location.href="${contextPath}/reviewList.me?cpage=${pi.currentPage + 1}"'>
                </div>
            </c:if>
        </c:if>
    </div>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h3 class="modal-title">한줄평</h3>
                <button type="button" class="close" data-dismiss="modal" onclick="closeModal()">&times;</button>
            </div>
                
            <form method="POST" action="saveReview.me">
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="concert-tag" onclick="location.href='${contextPath}/detail.co?concertNo='">
                        <table>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="star-rating">
                        <h3>별점</h3>
                        <label class="star-label">
                            <input type="radio" value="1" class="hidden" name="score">
                            <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png"></span>
                        </label>
                        <label class="star-label">
                            <input type="radio" value="2" class="hidden" name="score">
                            <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png"></span>
                        </label>
                        <label class="star-label">
                            <input type="radio" value="3" class="hidden" name="score">
                            <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png"></span>
                        </label>
                        <label class="star-label">
                            <input type="radio" value="4" class="hidden" name="score">
                            <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png"></span>
                        </label>
                        <label class="star-label">
                            <input type="radio" value="5" class="hidden" name="score">
                            <span class="star-icon"><img src="${contextPath}/resources/img/mypage/star.png"></span>
                        </label>
                    </div>
                    <div class="comment-area">
                        <h3>한줄평</h3>
                        <textarea rows="4" placeholder="200자 " maxlength="200" name="reviewContent" required></textarea>
                    </div>
                    <input type="hidden" name="concertNo" value="">
                    <input type="hidden" name="reviewNo" value="">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">저장</button>
                    <button type="button" class="btn btn-danger" onclick="deleteOneLineReview()">삭제</button>
                </div>
            </form>
        </div>
    </div>
</div>
