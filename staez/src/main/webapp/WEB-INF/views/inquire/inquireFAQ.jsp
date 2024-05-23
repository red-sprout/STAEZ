<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/inquire/inquireFAQ.css">
<title>Insert title here</title>
</head>
<body>
    <header>
        <jsp:include page="../common/header.jsp" />
    </header>
    <main>
        <div id="customer-service-content-area">
            <div id="customer-service-faq-choice">
                <span style="color: #B51B75;">FAQ</span>
            </div>
            <div id="customer-service-insert-from-choice" onclick="location.href='insertForm.iq'">
                <span>1대1 문의</span>
            </div>
        </div>
        <div id="customer-service-content-category-area">
            <div id="all-category" onclick="categoryChange(this)" class="category-choice choice-background"><span class="choice-color-span">전체</span></div>
            <div id="concert-category" onclick="categoryChange(this)" class="category-choice"><span class="categoryName"></span></div>
            <div id="community-category" onclick="categoryChange(this)" class="category-choice"><span class="categoryName"></span></div>
            <div id="reservation-category" onclick="categoryChange(this)" class="category-choice"><span class="categoryName"></span></div>
            <div id="refund-category" onclick="categoryChange(this)" class="category-choice"><span class="categoryName"></span></div>
            <div id="use-site-category" onclick="categoryChange(this)" class="category-choice"><span class="categoryName"></span></div>
            <div id="ticket-category" onclick="categoryChange(this)" class="category-choice"><span class="categoryName"></span></div>
        </div>
        <div id="faq-count-area">
            <span class="faq-count"></span>
        </div>
        <div class="faq-content-container">
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\up.png" alt="">
            </div>
            <div class="faq-content-answer-area">
                <div class="faq-content-answer">
                    <p>적어도 공연시작 30분 전에 도착하여 티켓을 발권 받으시고 화장실 등의 용무를 보신 후 여유 있게 객석 입장을 해주세요.</p>
                    <p>만석 공연의 경우 객석으로 입장하는 시간이 더 오래 걸릴 수 있으니 공연의 정시 시작을 위해 많은 협조 부탁드립니다.</p>
                </div>
                <div class="customer-service-insert-from-shortcut"><a href="">1대1 문의</a></div>
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
            <div class="faq-content-area">
                <div class="faq-content-category"><span>공연</span></div>
                <span class="faq-content">공연장에 몇 시까지 도착해야 하나요?</span>
                <img class="arrow-img" src="${contextPath}/resources/img/inquire\down.png" alt="">
            </div>
        </div>
        <div class="paging-area-container">
            <div id="paging-area">
                <a id="paging-tag">
                    <span>더보기 +</span>
                </a>
            </div>
        </div>  
        <div class="search-bar-area">
            <select name="search-way" id="search-way-box">
                <option value="faq-title">제목</option>
                <option value="faq-content">내용</option>
            </select>
            <input type="text" id="input-search-bar">
            <button id="search-button">
                <img src="${contextPath}/resources/img/inquire\search.png" alt="">
                <span>검색</span>
            </button>
        </div>
   </main>
   <script src="${contextPath}/resources/js/inquire/inquireFAQ.js"></script>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>