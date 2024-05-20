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
    </header>
    <main>
        <div id="customer-service-content-area">
            <div id="customer-service-faq-choice">
                <span>FAQ</span>
            </div>
            <div id="customer-service-insert-from-choice">
                <span style="color: #B51B75;">1대1 문의</span>
            </div>
        </div>
        <div id="to-inquire-area">
            <span>문의하기</span>
        </div>
        <form action="">
            <div class="to-inquire-title-area">
                <select name="to-inquire-category" id="to-inquire-category">
                    <option value="concert">공연</option>
                    <option value="community">커뮤니티</option>
                    <option value="reservation">예매</option>
                    <option value="refund">환불/취소</option>
                    <option value="use-site">사이트이용</option>
                    <option value="ticket">티켓</option>
                </select>
                <input type="text" id="to-inquire-title" placeholder="제목">
            </div>
            <div class="to-inquire-content-area">
                <textarea name="to-inquire-content" id="to-inquire-content" placeholder="내용을 입력해주세요"></textarea>
            </div>
            <div class="registering-area">
                <button type="submit" id="registering-btn">등록하기</button>
            </div> 
        </form> 

    </main>
    <footer>
    	<jsp:include page="../common/footer.jsp" />
    </footer>

</body>
</html>