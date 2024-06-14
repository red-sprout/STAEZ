<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/concertInsertForm.css'/>">
<script src="<c:url value='/resources/js/admin/noticeInsertForm.js'/>"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/concertInsertForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="post" action="concertInsert.ad" enctype="multipart/form-data">
                <h1>공연</h1>
                <hr>
                <li>
                    <h3>공연명</h3>
                    <input type="text" name="concertTitle" class="input">
                </li>
                <li id="concert-category">
                    <h3>장르</h3>
                </li>
                <li>
                    <h3>런타임</h3>
                    <input type="number" name="concertRuntime" class="short-input" placeholder="단위 : 분">
                </li>
                <li>
                    <h3>연령제한</h3>
                    <input type="text" name="ageLimit" class="short-input">
                </li>
                <li id="period">
                    <h3>공연기간</h3>
                    <div class="range-form">
                        <input type="date" name="startDate" class="short-input" placeholder="시작일">
                        <span><h3>~</h3></span>
                        <input type="date" name="endDate" class="short-input" placeholder="종료일">
                    </div>
                    <input type="text" name="schedule" class="time-input" placeholder="(예시)12:00-14:00">
                    <button class="btn-staez" type="button" onclick="addConcertSchedule()"><h4>추가</h4></button>
                </li>
                <div id="additional-schedule"></div>
                <li id="theater">
                    <h3>공연장소</h3>
                    <div class="form-search">
                        <button type="button">
                            <img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
                        </button>
                        <input type="text" name="theaterName" onkeydown="searchResult(this)" onkeyup="searchResult(this)">
                        <input type="hidden" name="theaterNo">
                    </div>
                    <ul class="search-list">
                    </ul>
                    <button class="btn-staez" type="button" onclick="seatSample()"><h4>좌석 미리보기</h4></button>
                </li>
                <li class="seat-grade">
                    <h3>좌석등급</h3>
                    <div class="range-form">
                        <input type="number" name="seatStartRow" class="short-input" placeholder="좌석 첫 행">
                        <span><h3>~</h3></span>
                        <input type="number" name="seatEndRow" class="short-input" placeholder="좌석 끝 행">
                    </div>
                    <input type="date" name="concertDate" class="short-short-input">
                </li>
                <li class="seat-grade">
                    <h3></h3>
                    <div class="range-form">
                        <input type="number" name="seatStartCol" class="short-input" placeholder="좌석 첫 열">
                        <span><h3>~</h3></span>
                        <input type="number" name="seatEndCol" class="short-input" placeholder="좌석 끝 열">
                    </div>
                    <input type="text" name="grade" class="short-short-input" placeholder="(등급)">
                    <input type="number" name="price" class="short-short-input" placeholder="(가격, 원)">
                    <button class="btn-staez" type="button" onclick="addGrade(this)"><h4>추가</h4></button>
                </li>
                <div id="additional-grade"></div>
                <li>
                    <h3>출연진</h3>
                    <input type="text" name="concertMembers" class="short-input" placeholder="">
                </li>
                <li>
                    <h3>제작진</h3>
                    <input type="text" name="concertProduction" class="short-input" placeholder="">
                </li>
                <li>
                    <h3>포스터</h3>
                    <input type="file" name="upfile">
                </li>
                <li>
                    <div id="summernote"></div>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="button">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple" type="button">
                        <h3>목록</h3>
                    </button>
                </li>
            </form>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
</body>
</html>