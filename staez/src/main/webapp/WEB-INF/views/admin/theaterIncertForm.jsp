<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/theaterInsertForm.css'/>">
<script src="<c:url value='/resources/js/admin/noticeIncertForm.js'/>"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left">
                <h1>공연장</h1>
                <hr>
                <li>
                    <h3>공연장명</h3>
                    <input type="text" name="" id="" class="input">
                </li>
                <li id="period">
                    <h3>크기</h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 첫 행">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 끝 행">
                    </div>
                </li>
                <li>
                    <h3>지역</h3>
                    <input type="text" name="" class="short-input" placeholder="">
                </li>
                <li>
                    <h3>전화번호</h3>
                    <input type="text" name="" class="short-input" placeholder="">
                </li>
                <li>
                    <h3>좌석 미리보기</h3>
                    <span class="msg">*예약 불가능한 좌석은 클릭하시기 바랍니다</span>
                </li>
                <li class="seat-ui">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                                <th>6</th>
                                <th>7</th>
                                <th>8</th>
                                <th>9</th>
                                <th>10</th>
                                <th>11</th>
                                <th>12</th>
                                <th>13</th>
                                <th>14</th>
                                <th>15</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>A</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>B</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>C</th>
                                <th class="seat-no">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>D</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                            <tr>
                                <th>E</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                                <th class="seat-yes">&nbsp;</th>
                            </tr>
                        </tbody>
                    </table>
                </li>
                <li id="community-submit">
                    <button class="btn-staez purple" type="submit">
                        <h3>등록</h3>
                    </button>
                    <button class="btn-staez purple">
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