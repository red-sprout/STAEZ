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
        <script src="${contextPath}/resources/js/api/inquireapi.js"></script>
        <script src="${contextPath}/resources/js/inquire/inquireFAQ.js"></script>
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
           <!--script로-->
            
        </div>
        <div class="paging-area-container">
            <div id="paging-area">
                <a id="paging-tag">
                    <span>더보기 +</span>
                </a>
            </div>
        </div>
            <div class="search-bar-area">
                <select name="option" id="search-way-box">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="content" id="input-search-bar">
                <button onclick="faqSearchEv()" id="search-button">
                    <img src="${contextPath}/resources/img/inquire\search.png" alt="">
                    <span>검색</span>
                </button>
            </div>
   </main>
   
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>