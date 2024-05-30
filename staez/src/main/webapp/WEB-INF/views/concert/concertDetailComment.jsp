<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>concert</title>

    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- 적용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertDetailView.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/concert/concertDetailInformationViewAjax.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/65a2de1a44.js" crossorigin="anonymous"></script>
    <!-- 달력 -->
    <script src="${pageContext.request.contextPath}/resources/js/concert/concertDetailCalendar.js"></script>
    <!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
    <!-- 적용 자바스크립트 -->
    <script src="<c:url value='/resources/js/concert/concertDetail.js'/>"></script>

</head>

<body>

    <div>
        <jsp:include page="./concertDetailMain.jsp"/>
    </div>

<!-- 공연상세페이지 아래쪽: ajax(공연상세정보, 판매정보, 한줄평, 관람후기 내용) -->
    <!-- 한줄평 -->
    <section>
        <div>
            <p><h4><b>글쓰기 전 주의사항</b></h4></p>
            <p>※ 저속한 표현, 타인의 명예훼손, 광고성 게시물 등 게시판 운영규정에 어긋나는 글은 통보 없이 삭제될 수 있습니다.</p>
            <p>※ 등록된 관람평, 관람후기의 수정과 삭제는 마이페이지에서 가능합니다.</p>        
        </div>
        <br>
        <div>
            <div class="concert-detail-comment-div">
                <!-- <table class="concert-detail-comment-table">
                        <tbody>
                            <tr>
                                <td align="left"><b>뮤덕이</b></td>
                                <td align="right">2024-05-01 00:00</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">재미있을 것 같습니다</td>
                            </tr>
                        </tbody>                 
                        <tbody>
                            <tr>
                                <td align="left"><b>뮤덕이</b></td>
                                <td align="right">2024-05-01 00:00</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">재미있을 것 같습니다</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td align="left"><b>뮤덕이</b></td>
                                <td align="right">2024-05-01 00:00</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">재미있을 것 같습니다</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td align="left"><b>뮤덕이</b></td>
                                <td align="right">2024-05-01 00:00</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">재미있을 것 같습니다</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td align="left"><b>뮤덕이</b></td>
                                <td align="right">2024-05-01 00:00</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">재미있을 것 같습니다</td>
                            </tr>
                        </tbody>
                      
                </table>
            </div>
            <br>         -->

    </section>

    <div class="concert-detail-comment-page-list">    
        <!-- <div class="page-list" align="center">
            <div class="pagination">
                <img src="${pageContext.request.contextPath}/resources/img/main/before.png">
            </div>
            <div class="pagination current"><h4>1</h4></div>
            <div class="pagination"><h4>2</h4></div>
            <div class="pagination"><h4>3</h4></div>
            <div class="pagination"><h4>4</h4></div>
            <div class="pagination"><h4>5</h4></div>
            <div class="pagination">
                <img src="${pageContext.request.contextPath}/resources/img/main/after.png">
            </div>
        </div>
    </div>
        <br><br> -->
    </div>

	<div>
		<jsp:include page="../common/footer.jsp" />
	</div>

    
</body>
</html>