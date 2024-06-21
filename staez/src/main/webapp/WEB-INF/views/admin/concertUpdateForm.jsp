<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/concertInsertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/concertUpdateForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="post" action="concertInsert.ad" enctype="multipart/form-data">
                <input type="hidden" name="concertNo" value="${concert.concertNo}">
                <input type="hidden" name="categoryName" value="${concert.categoryName}">
                <h1>공연</h1>
                <hr>
                <li>
                    <h3>공연명</h3>
                    <input type="text" name="concertTitle" class="input" value="${concert.concertTitle}">
                </li>
                <li id="concert-category">
                    <h3>장르</h3>
                </li>
                <li>
                    <h3>런타임</h3>
                    <input type="number" name="concertRuntime" class="short-input" placeholder="단위 : 분" value="${concert.concertRuntime}">
                </li>
                <li>
                    <h3>연령제한</h3>
                    <input type="text" name="ageLimit" class="short-input" value="${concert.ageLimit}">
                </li>
                <li id="period">
                    <h3>공연기간</h3>
                    <div class="range-form">
                        <input type="date" name="startDate" class="short-input" placeholder="시작일" value="${concertSchedule.get(0).startDate}">
                        <span><h3>~</h3></span>
                        <input type="date" name="endDate" class="short-input" placeholder="종료일" value="${concertSchedule.get(0).endDate}">
                    </div>
                    <input type="text" name="schedule" class="time-input" placeholder="(예시)12:00-14:00" value="${concertSchedule.get(0).schedule}">
                    <button class="btn-staez" type="button" onclick="addConcertSchedule()"><h4>추가</h4></button>
                </li>
                <div id="additional-schedule">
                    <c:forEach var="cs" items="${concertSchedule}" varStatus="status">
                        <c:if test="${!status.first}">
                            <div class="condition">
                                <h3>&nbsp;</h3>
                                <div class="range-form">
                                    <input type="date" name="startDate" class="short-input" placeholder="시작일" value="${cs.startDate}">
                                    <span><h3>~</h3></span>
                                    <input type="date" name="endDate" class="short-input" placeholder="종료일" value="${cs.endDate}">
                                </div>
                                <input type="text" name="schedule" class="time-input" placeholder="(예시)12:00-14:00" value="${cs.schedule}">
                                <button class="btn-staez" type="button" onclick="noConcertSchedule(this)">
                                    <h4>공연 없음</h4>
                                </button>
                                <button class="btn-staez" type="button" onclick="deleteConcertSchedule(this)">
                                    <h4>삭제</h4>
                                </button>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <li id="theater">
                    <h3>공연장소</h3>
                    <div class="form-search">
                        <button type="button">
                            <img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
                        </button>
                        <input type="text" name="theaterName" onkeydown="searchResult(this)" onkeyup="searchResult(this)" value="${concert.theaterName}">
                        <input type="hidden" name="theaterNo" value="${concert.theaterNo}">
                    </div>
                    <ul class="search-list">
                    </ul>
                    <button class="btn-staez" type="button" onclick="seatSample(this)"><h4>좌석 미리보기</h4></button>
                </li>
                <li class="seat-grade">
                    <h3>좌석등급</h3>
                    <div class="range-form">
                        <input type="number" name="seatStartRow" class="short-input" placeholder="좌석 첫 행" value="${seat.get(0).seatStartRow}">
                        <span><h3>~</h3></span>
                        <input type="number" name="seatEndRow" class="short-input" placeholder="좌석 끝 행" value="${seat.get(0).seatEndRow}">
                    </div>
                    <input type="date" name="concertDate" class="short-short-input" value="${seat.get(0).concertDate}">
                </li>
                <li class="seat-grade">
                    <h3></h3>
                    <div class="range-form">
                        <input type="number" name="seatStartCol" class="short-input" placeholder="좌석 첫 열" value="${seat.get(0).seatStartCol}">
                        <span><h3>~</h3></span>
                        <input type="number" name="seatEndCol" class="short-input" placeholder="좌석 끝 열" value="${seat.get(0).seatEndCol}">
                    </div>
                    <input type="text" name="grade" class="short-short-input" placeholder="(등급)" value="${seat.get(0).grade}">
                    <input type="number" name="price" class="short-short-input" placeholder="(가격, 원)" value="${seat.get(0).price}">
                    <button class="btn-staez" type="button" onclick="addGrade(this)"><h4>추가</h4></button>
                </li>
                <div id="additional-grade">
                    <c:forEach var="s" items="${seat}" varStatus="status">
                        <c:if test="${!status.first}">
                            <div>
                                <div class="grade-row">
                                    <h3>&nbsp;</h3>
                                    <div class="range-form">
                                        <input type="number" name="seatStartRow" class="short-input" placeholder="좌석 첫 행"
                                            value="${s.seatStartRow}">
                                        <span><h3>~</h3></span>
                                        <input type="number" name="seatEndRow" class="short-input" placeholder="좌석 끝 행" value="${s.seatEndRow}">
                                    </div>
                                    <input type="date" name="concertDate" class="short-short-input" value="${s.concertDate}">
                                </div>
                                <div class="grade-col">
                                    <h3>&nbsp;</h3>
                                    <div class="range-form">
                                        <input type="number" name="seatStartCol" class="short-input" placeholder="좌석 첫 열"
                                            value="${s.seatStartCol}">
                                        <span><h3>~</h3></span>
                                        <input type="number" name="seatEndCol" class="short-input" placeholder="좌석 끝 열" value="${s.seatEndCol}">
                                    </div>
                                    <input type="text" name="grade" class="short-short-input" placeholder="(등급)" value="${s.grade}">
                                    <input type="number" name="price" class="short-short-input" placeholder="(가격, 원)" value="${s.price}">
                                    <button class="btn-staez" type="button" onclick="deleteGrade(this.parentElement)"><h4>삭제</h4></button>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <li>
                    <h3>출연진</h3>
                    <input type="text" name="concertMembers" class="short-input" value="${concert.concertMembers}">
                </li>
                <li>
                    <h3>제작진</h3>
                    <input type="text" name="concertProduction" class="short-input" value="${concert.concertProduction}">
                </li>
                <li>
                    <div id="summernote">${concert.concertPlot}</div>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" id="update-submit" type="button">
                        <h3>수정</h3>
                    </button>
                    <button class="btn-staez purple" type="button" onclick="location.href = 'concertList.ad'">
                        <h3>목록</h3>
                    </button>
                </li>
            </form>
        </div>
    </main>
    <!-- The Modal -->
    <div class="modal" id="theater-modal">
        <div class="modal-dialog" style="max-width: fit-content;">
            <div class="modal-content" style="min-width: max-content";>
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">좌석 조회</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <table>
                        <thead></thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>