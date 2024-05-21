
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

// 이전페이지로 돌아가는
document.addEventListener('DOMContentLoaded', function() {
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        console.log("작동됨"); // 이 부분이 정상적으로 실행되지 않는다면 문제가 있을 수 있습니다.
        window.history.back();
    });

    var loginButton = document.getElementById('loginButton');
    loginButton.addEventListener('click', function() {
        window.location.href = '${contextPath}/loginForm.jsp';
    });
});



