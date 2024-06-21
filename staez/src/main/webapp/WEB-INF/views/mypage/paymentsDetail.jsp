<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/paymentsDetail.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="${contextPath}/resources/js/api/mypageapi.js"></script>
<script src="${contextPath}/resources/js/mypage/paymentsDetail.js"></script>

<title>Insert title here</title>
</head>

<body onload="init()">
    <main>
        <input type="hidden" id="contextPath" value="${contextPath}">
    
        <div id="info-section">
            <table>
                <thead>
                    <tr>
                        <th colspan="2"><h2>예약자정보</h2></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>예약자명</th>
                        <td>${payments.resName}</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>${payments.resBirth}</td>
                    </tr>
                    <tr>
                        <th>휴대폰번호</th>                    
                        <td>${payments.resPhone}</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <table>
                <thead>
                    <tr>
                        <th colspan="2"><h2>예매정보</h2></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>예매번호</th>
                        <td>${payments.reserveNo}</td>
                    </tr>
                    <tr>
                        <th>예매시간</th>
                        <td><fmt:formatDate value="${payments.reserveDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>                        
                    </tr>
                    <tr>
                        <th>공연명</th>
                        <td>${payments.concertTitle}</td>
                    </tr>
                    <tr>
                        <th>공연장명</th>                    
                        <td>${payments.theaterName}</td>
                    </tr>
                    <tr>
                        <th>공연시간</th>                    
                        <td>
                            <fmt:formatDate value="${payments.concertDate}" pattern="yyyy-MM-dd" />
                            ${payments.schedule}
                            (${payments.concertRuntime}분)
                        </td>                        
                    </tr>
                    <tr>
                        <th>좌석</th>                    
                        <td class="seat-no">
                            <input type="hidden" name="row" value="${payments.reserveRow}">
                            <input type="hidden" name="col" value="${payments.reserveCol}">
                            <input type="hidden" name="seat" value="${payments.grade}">
                        </td>
                    </tr>                    
                </tbody>
            </table>
            <br>
            <table>
                <thead>
                    <tr>
                        <th colspan="2"><h2>입금정보</h2></th>
                    </tr>
                </thead>
                    <tbody>
                        <tr>
                            <th>결제방식</th>
                            <td>${payments.payMethod}</td>
                        </tr>
                        <c:set var="pMethod" value="${payments.payMethod}" />
                        <c:if test="${pMethod eq '무통장입금'}">
                            <tr>
                                <th>입금 계좌번호</th>
                                <td>111-1111-1111-11(은행명)</td>
                            </tr>
                            <tr>
                                <th>입금자명</th>
                                <td>김효영</td>
                            </tr>
                        </c:if>
                        <c:remove var="pMethod" />
                        <tr>
                            <th>입금금액</th>
                            <td> 
                                <fmt:formatNumber value="${payments.price}" pattern="#,###￦" />
                            </td>
                        </tr>
                    </tbody>
            </table>
            <c:set var="pStatus" value="${payments.reserveStatus}" />
            <c:if test="${pStatus eq 'Y'}">
                <span id="pStatus">결제완료</span>
            </c:if>
            <c:remove var="pStatus" />
        </div>

        <div id="btn-section">
            <button class="btn-staez" onclick="window.close()">닫기</button>
        </div>
    </main>
</body>
</html>