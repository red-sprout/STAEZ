<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/theaterInsertForm.css'/>">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <script src="<c:url value='/resources/js/api/adminapi.js'/>"></script>
        <script src="<c:url value='/resources/js/admin/theaterInsertForm.js'/>"></script>
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left" method="post" action="theaterInsert.ad">
                <h1>공연장</h1>
                <hr>
                <li>
                    <h3>공연장명</h3>
                    <input type="text" name="theaterName" class="input" required>
                </li>
                <li id="period">
                    <h3>크기</h3>
                    <div class="range-form">
                        <input type="number" name="theaterRow" class="short-input" placeholder="좌석 행 수" onkeyup="updateRow(this)" required min="1">
                        <span><h3>~</h3></span>
                        <input type="number" name="theaterCol" class="short-input" placeholder="좌석 열 수" onkeyup="updateCol(this)" required min="1">
                    </div>
                </li>
                <li>
                    <h3>지역</h3>
                    <input type="text" name="address" class="short-input" required>
                </li>
                <li>
                    <h3>전화번호</h3>
                    <input type="text" name="telno" class="short-input" required>
                </li>
                <li>
                    <h3>좌석 미리보기</h3>
                    <span class="msg">*예약 불가능한 좌석은 클릭하시기 바랍니다</span>
                </li>
                <li class="seat-ui">
                    <table>
                        <thead><tr><th></th></tr></thead>
                        <tbody></tbody>
                    </table>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="button" onclick="submitTheater()">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple" type="button" onclick="location.href='theaterList.ad'">
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