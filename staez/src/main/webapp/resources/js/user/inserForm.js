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
                        url: "/checkDuplicate", // 수정
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

    // 초기화 함수
    function init() {
        handleDomainListChange();
    }

    /// 이메일
    function handleDomainListChange() {
        const domainList = document.getElementById("domain-list-1"); // id 수정
        const emailSuffixInput1 = document.getElementById("email-suffix1"); // id 수정
        const emailSuffixInput2 = document.getElementById("email-suffix2"); // id 수정

        if (domainList) {
            domainList.addEventListener("change", function () {
                const selectedOption = domainList.options[domainList.selectedIndex].value;

                if (selectedOption !== "type") {
                    emailSuffixInput1.value = selectedOption;
                    emailSuffixInput1.placeholder = "";
                    emailSuffixInput2.value = selectedOption; // 수정
                } else {
                    emailSuffixInput1.value = "";
                    emailSuffixInput1.placeholder = "직접 입력";
                    emailSuffixInput2.value = ""; // 수정
                }
            });
        }
    }

    // 회원가입 폼 제출 기능 추가
    document.addEventListener('DOMContentLoaded', function () {
        const enrollForm = document.getElementById('enrollForm');
        if (enrollForm) {
            enrollForm.addEventListener('submit', function (event) {
                event.preventDefault(); // 기본 제출 동작 방지

                // 여기에 폼 데이터를 수집하고 서버로 전송하는 로직을 추가하세요.
                // 예: fetch를 사용하여 AJAX 요청을 보냅니다.
            });
        }
    });

    init(); // 페이지 로드 시 초기화 함수 호출

    // 중복검사 버튼 클릭 이벤트 핸들러
    function checkNickname() {
        console.log('닉네임 중복검사 버튼이 클릭되었습니다.');
        checkDuplicate('nickname', 'nicknameResult'); // 수정
    }


    function checkUserId() {
        console.log('아이디 중복검사 버튼이 클릭되었습니다.');
        checkDuplicate('userId', 'userIdResult'); // 수정
    }

    // 이전페이지로 돌아가는
    document.addEventListener('DOMContentLoaded', function() {
        var backButton = document.getElementById('backButton');
        backButton.addEventListener('click', function() {
            window.history.back();
        });

        var loginButton = document.getElementById('loginButton');
        loginButton.addEventListener('click', function() {
            window.location.href = '/loginForm.jsp'; // 수정
        });
    });