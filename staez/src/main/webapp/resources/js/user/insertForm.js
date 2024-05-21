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

// 최대 선택 가능한 버튼 수
const maxSelection = 3;

// 선택된 버튼 수
let selectedCount = 0;

// 버튼 클릭 이벤트 처리
document.querySelectorAll('.btn-staez3').forEach(button => {
    button.addEventListener('click', function() {
        // 선택된 버튼인지 확인
        const isSelected = button.classList.contains('selected');
        
        // 최대 선택 개수 이내인 경우
        if (isSelected || selectedCount < maxSelection) {
            // 버튼의 선택 여부 변경
            button.classList.toggle('selected');

            // 선택된 버튼 수 갱신
            selectedCount += isSelected ? -1 : 1;
        } else {
            // 최대 선택 개수를 초과한 경우 선택 불가능하도록 경고 메시지 등을 표시할 수 있음
            console.log("최대 선택 개수를 초과하였습니다.");
        }
    });
});

