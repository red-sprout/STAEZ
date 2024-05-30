<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>concert</title>

</head>

<body>

    <div>
        <jsp:include page="./concertDetailMain.jsp"/>
    </div>

<!-- 공연상세페이지 아래쪽: ajax(공연상세정보, 판매정보, 한줄평, 관람후기 내용) -->
<!-- 공연상세정보 -->
.    <!-- https://baessi.tistory.com/84 -->
    <!-- </section>
    <hr class="concert-detail-hr">
    <br>

    <section class="concert-detail-tab">
        <div class="concert-detail-subject">
            <br>
            <span><h2>작품소개</h2></span>
            <div>
                ${fn:replace(con.concertPlot, replaceChar, "<br/>")}
            </div>
        </div>
        <br><br>
        <div class="concert-detail-subject">
            <span><h2>공지사항</h2></span>
            <img src="${pageContext.request.contextPath}${con.filePath}${con.changeName}" alt="">
        </div>
        <br><br>
    </section> -->

    <div>
        <jsp:include page="../common/footer.jsp" />
    </div>

    
</body>
</html>