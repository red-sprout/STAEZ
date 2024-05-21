//이메일
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
        window.history.back();
    });
});