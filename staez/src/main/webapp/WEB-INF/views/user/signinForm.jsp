<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/user/signin.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>회원가입</title>
</head>

<body onload="init()">
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
        <div class="image-container">
            <img src="${contextPath}/resources/img/user/dlatl.png" alt="광고배너">
        </div>
        <h1 class="signin-h1">정보입력</h1>
        <hr>
        <form id="enrollForm" action="">
            <div class="insert-member">
                <table class="insert-member-table">
                    <tr>
                        <th>
                            <h2>닉네임</h2>
                        </th>
                        <td colspan="2"><input type="text" placeholder="8~16자" name="nickname" id="nickname"></td>
                        <td><input type="button" class="check_button" value="중복검사" onclick="checkNickname()"></td>
                    </tr>
                    <tr>
                        <th>
                            <h2>아이디</h2>
                        </th>
                        <td colspan="2"><input type="text" placeholder="8~16자" name="userId" id="userId"></td>
                        <td><input type="button" class="check_button" value="중복검사" onclick="checkUserId()"></td>
                    </tr>
                    <tr>
                        <th>
                            <h2>비밀번호</h2>
                        </th>
                        <td colspan="2"><input type="password" placeholder="8~16자"></td>
                    </tr>
                    <tr>
                        <th>
                            <h2>비밀번호 확인</h2>
                        </th>
                        <td colspan="2"><input type="password"></td>
                    </tr>
                    <tr>
                        <th>
                            <h2>휴대폰 번호</h2>
                        </th>
                        <td colspan="6" class="email-container">
                            <div style="display: flex;">
                                <select class="box" id="domain-list">
                                    <option value="010" selected>010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <span id="email-prefix-shift2">-</span>
                                <input type="text" id="email-suffix">
                                <span id="email-prefix-shift2">-</span>
                                <input type="text" id="email-suffix">
                                <td colspan="1"><input type="button" class="check_button" value=" 인증번호 전송 "></td>
                            </div>
                        </td>                       
                    </tr>
                    <tr>
                        <th></th>
                        <td><input type="text"></td>
                        <td><input type="button" class="check_button" value="인증확인"></td>
                    </tr>
                    <tr>
                        <th>
                            <h2>생년월일</h2>
                        </th>
                        <td colspan="2"><input type="text" placeholder="- 없이 8자"></td>
                    </tr>
                    <tr>
                        <th>
                            <h2>이메일</h2>
                        </th>
                        <td colspan="5" class="email-container">
                            <div style="display: flex;">
                                <input type="text" id="email-prefix">
                                <span id="email-prefix-shift2">@</span>
                                <input type="text" id="email-suffix" placeholder="직접 입력">
                            </div>
                        </td>
                        <td>
                            <select class="box" id="domain-list">
                                <option value="type">직접 입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
                        </td>                        
                    </tr>
                    <tr>
                        <th>
                            <h2>성별</h2>
                        </th>
                        <td colspan="2">
                            <input type="checkbox" name="gender" value="남" id="man">
                            <label for="man" id="label-man">남</label>
                            <input type="checkbox" name="gender" value="여" id="female">
                            <label for="female">여</label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h2>주소</h2>
                        </th>
                        <td colspan="2"><input type="text"></td>
                        <td><input type="button" class="check_button" value="우편번호"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="2"><input type="text" placeholder="자세한주소"></td>
                    </tr>
                    <tr>
                        <th>관심장르(택3)</th>
                        <td colspan="4">
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>클래식</h3>
                            </button>
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>국악</h3>
                            </button>
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>대중음악</h3>
                            </button>
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>기타</h3>
                            </button>
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>뮤지컬</h3>
                            </button>
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>연극</h3>
                            </button>
                            <button class="btn-staez3" onclick="toggleButton(event, this)">
                                <h3>서커스/마술</h3>
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <div class="insert-member-div">
            <button type="button" id="backButton">이전</button>
            <button type="submit">다음</button>
        </div>
    </main>
    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </footer>
    <script>
       // 아이디 닉네임 중복체크
        function checkDuplicate(fieldId, resultId) {
            const fieldInput = document.querySelector(`#${fieldId}`);
            let eventFlag;

            fieldInput.onkeyup = function () {
                clearTimeout(eventFlag);
                const fieldValue = fieldInput.value;

                if (fieldValue.trim().length >= 5) {
                    eventFlag = setTimeout(function () {
                        console.log("전송");

                        $.ajax({
                            url: "checkDuplicate.php",
                            data: { fieldValue: fieldValue },
                            success: function (result) {
                                const resultElement = document.getElementById(resultId);
                                resultElement.style.display = "block";

                                if (result === "NNNNN") {
                                    resultElement.style.color = "red";
                                    resultElement.innerText = "이미 사용 중인 값입니다.";
                                } else {
                                    resultElement.style.color = "green";
                                    resultElement.innerText = "사용 가능한 값입니다.";
                                }
                            },
                            error: function () {
                                console.log("중복 검사 ajax 요청 실패");
                            }
                        });
                    }, 500);
                } else {
                    document.getElementById(resultId).style.display = "none";
                }
            };
        }

        // 이메일 접미사가 변경될 때마다 호출되는 함수
        function handleDomainListChange() {
            const domainList = document.getElementById("domain-list");
            const emailSuffixInput = document.getElementById("email-suffix");

            domainList.addEventListener("change", function () {
                const selectedOption = domainList.options[domainList.selectedIndex].value;

                if (selectedOption !== "type") {
                    emailSuffixInput.value = selectedOption;
                    emailSuffixInput.placeholder = "";
                } else {
                    emailSuffixInput.value = "";
                    emailSuffixInput.placeholder = "직접 입력";
                }
            });
        }

        // 초기화 함수
        function init() {
            handleDomainListChange();
        }

        init(); // 페이지 로드 시 초기화 함수 호출


    // 버튼 클릭 이벤트 핸들러 함수
    function handleButtonClick() {
        console.log("중복검사 버튼을 클릭했습니다.");
    }

    // 버튼 잘 눌리나 확인 스크립트
    // 중복검사 버튼 클릭 이벤트 핸들러
    function checkNickname() {
            console.log('닉네임 중복검사 버튼이 클릭되었습니다.');
            // 닉네임 중복 검사 로직 추가
        }

    function checkUserId() {
        console.log('아이디 중복검사 버튼이 클릭되었습니다.');
        // 아이디 중복 검사 로직 추가
    }


    // 이전페이지로 돌아가는
    document.addEventListener('DOMContentLoaded', function() {
        var backButton = document.getElementById('backButton');
        backButton.addEventListener('click', function() {
            window.history.back();
        });

        var loginButton = document.getElementById('loginButton');
        loginButton.addEventListener('click', function() {
            window.location.href = '${contextPath}/loginForm.jsp';
        });
    });

    </script>    
</body>

</html>