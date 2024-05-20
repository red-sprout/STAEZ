<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/concertInsertForm.css'/>">
<script src="<c:url value='/resources/js/admin/noticeIncertForm.js'/>"></script>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div id="community-wrapper">
            <form id="community-contents" align="left">
                <h1>공연</h1>
                <hr>
                <li>
                    <h3>공연명</h3>
                    <input type="text" name="" id="" class="input">
                </li>
                <li>
                    <h3>장르</h3>
                    <button class="btn-staez checked">
                        <h4>뮤지컬</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>클래식</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>국악</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>대중음악</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>연극</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>서커스/마술</h4>
                    </button>
                    <button class="btn-staez">
                        <h4>기타</h4>
                    </button>
                </li>
                <li id="period">
                    <h3>공연기간</h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="시작일">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="종료일">
                    </div>
                    <input type="text" name="" class="time-input" placeholder="(예시)12:00~14:00">
                    <button class="btn-staez"><h4>추가</h4></button>
                </li>
                <li>
                    <h3></h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="시작일">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="종료일">
                    </div>
                    <input type="text" name="" class="time-input" placeholder="(예시)12:00~14:00">
                    <button class="btn-staez checked"><h4>공연 없음</h4></button>
                    <button class="btn-staez"><h4>삭제</h4></button>
                </li>
                <li id="theater">
                    <h3>공연장소</h3>
                    <div class="form-search">
                        <button>
                            <img src="<c:url value='/resources/img/community/communityMain/search-icon.png'/>" alt="">
                        </button>
                        <input type="text" name="" id="">
                    </div>
                    <button class="btn-staez"><h4>좌석 미리보기</h4></button>
                </li>
                <li>
                    <h3>좌석등급</h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 첫 행">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 끝 행">
                    </div>
                </li>
                <li>
                    <h3></h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 첫 열">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 끝 열">
                    </div>
                    <input type="text" name="" class="short-short-input" placeholder="(등급)">
                    <input type="text" name="" class="short-short-input" placeholder="(가격, 원)">
                    <button class="btn-staez"><h4>추가</h4></button>
                </li>
                <li>
                    <h3></h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="시작일">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="종료일">
                    </div>
                </li>
                <li>
                    <h3></h3>
                    <div class="range-form">
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 첫 열">
                        <span><h3>~</h3></span>
                        <input type="text" name="" id="" class="short-input" placeholder="좌석 끝 열">
                    </div>
                    <input type="text" name="" class="short-short-input" placeholder="(등급)">
                    <input type="text" name="" class="short-short-input" placeholder="(가격, 원)">
                    <button class="btn-staez"><h4>삭제</h4></button>
                </li>
                <li>
                    <h3>출연진</h3>
                    <input type="text" name="" class="short-input" placeholder="">
                </li>
                <li>
                    <h3>제작진</h3>
                    <input type="text" name="" class="short-input" placeholder="">
                </li>
                <li>
                    <h3>포스터</h3>
                    <input type="file" name="" id="">
                </li>
                <li>
                    <div id="summernote"></div>
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