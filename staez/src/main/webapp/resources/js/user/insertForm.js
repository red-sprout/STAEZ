// 이메일
function handleDomainListChange() {
    const emailDomainList = document.getElementById("email-domain-list");
    const emailSuffixInput = document.getElementById("email-suffix");

    // 요소가 존재하는지 확인
    if (emailDomainList && emailSuffixInput) {
        emailDomainList.addEventListener("change", function () {
            const selectedOption = emailDomainList.options[emailDomainList.selectedIndex].value;

            if (selectedOption !== "type") {
                emailSuffixInput.value = selectedOption;
                emailSuffixInput.placeholder = "";
            } else {
                emailSuffixInput.value = "";
                emailSuffixInput.placeholder = "직접 입력";
            }
        });
    }
}

function handlePhonePrefixChange() {
    const phonePrefix = document.getElementById("phone-prefix");
    const phoneSuffix1 = document.getElementById("phone-suffix1");
    const phoneSuffix2 = document.getElementById("phone-suffix2");

    // 요소가 존재하는지 확인
    if (phonePrefix && phoneSuffix1 && phoneSuffix2) {
        phonePrefix.addEventListener("change", function () {
            const selectedPrefix = phonePrefix.value;
            // Do something with the selected prefix, if needed
        });
    }
}

function init() {
    handleDomainListChange();
    handlePhonePrefixChange();
}

init(); // 페이지 로드 시 초기화 함수 호출


// 이전페이지로 돌아가는
document.addEventListener('DOMContentLoaded', function() {
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        console.log("작동됨"); // 이 부분이 정상적으로 실행되지 않는다면 문제가 있을 수 있습니다.
        window.history.back();
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // 버튼 클릭 이벤트 처리
    document.querySelectorAll('.btn-staez3').forEach(button => {
        button.addEventListener('click', function() {
            // 버튼의 선택 여부 변경
            button.classList.toggle('selected');
            
            // 선택된 버튼 수 확인
            const selectedButtons = document.querySelectorAll('.btn-staez3.selected');
            const selectedCount = selectedButtons.length;

            // 선택된 버튼이 3개를 초과하는 경우 선택 해제
            if (selectedCount > 3) {
                button.classList.remove('selected');
            }
        });
    });
});

// 아이디 중복 체크
document.addEventListener('DOMContentLoaded', function() {
    const idInput = document.querySelector("#enrollForm input[name=userId]");
    const checkButton = document.getElementById("checkButton");
    const checkResult = document.getElementById("checkResult");
    const submitButton = document.querySelector("#enrollForm input[type='button']");

    checkButton.addEventListener('click', function() {
        const str = idInput.value;
        if (str.trim().length >= 5) { // 5글자 이상
            console.log("전송"); // 디버깅용 콘솔 로그
            $.ajax({
                url: "idCheck.me",
                data: { checkId: str },
                success: function (result) {
                    checkResult.style.display = "block";

                    if (result === "NNNNN") { // 사용이 불가한 경우
                        submitButton.disabled = true;
                        checkResult.style.color = "red";
                        checkResult.innerText = "이미 사용중인 아이디입니다.";
                    } else { // 사용이 가능한 경우
                        submitButton.disabled = false;
                        checkResult.style.color = "green";
                        checkResult.innerText = "사용가능한 아이디입니다.";
                    }
                },
                error: function () {
                    console.log("아이디 중복체크 ajax 실패");
                }
            });
        } else { // 5글자 이하
            submitButton.disabled = true;
            checkResult.style.display = "none";
        }
    });
});



