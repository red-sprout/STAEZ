<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/inquire/inquireInsertForm.css">
<title>Insert title here</title>

</head>
<body>
	<header>
        <jsp:include page="../common/header.jsp" />
        <script src="${contextPath}/resources/js/api/inquireapi.js"></script>
        <script src="${contextPath}/resources/js/inquire/inquireInsertForm.js"></script>
    </header>
    <main>
        <input type="hidden" name="modelCategoryNo" value="${categoryNo}">
        <div id="customer-service-content-area">
            <div id="customer-service-faq-choice" onclick="location.href='main.iq'">
                <span>FAQ</span>
            </div>
            <div id="customer-service-insert-from-choice">
                <span style="color: #B51B75;">1대1 문의</span>
            </div>
        </div>
        <div id="to-inquire-area">
            <span>문의하기</span>
        </div>
        <form action="insert.iq" method="post">
            <input type="hidden" name="userNo" value="${loginUser.userNo}">
            <div class="to-inquire-title-area">
                <select name="categoryNo" id="to-inquire-category">
                    <!--ajax로 부르기-->
                    
                </select>
                <input type="text" id="to-inquire-title" name="boardTitle" placeholder="제목">
            </div>
            <div class="to-inquire-content-area">
                <textarea name="boardContent" id="to-inquire-content" placeholder="내용을 입력해주세요"></textarea>
            </div>
            <div class="registering-area">
                <button onclick="insertInquire(this); return false" id="registering-btn">등록하기</button>
            </div> 
        </form> 
     
    </main>
    <footer>
    	<jsp:include page="../common/footer.jsp" />
    </footer>

</body>
</html>