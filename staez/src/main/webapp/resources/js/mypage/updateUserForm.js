function init() {
    updateCombinedAddress();
    updateCombinedPhone();
    emailDomain(); // Initialize email input fields on page load

}

// 회원정보 변경 전 비밀번호 인증
function checkPassword() {
    const inputPassword = document.getElementById('auth-password').value;
    const correctPassword = 'pass01'; // 실제 비밀번호 확인 로직으로 대체해야 함

    if (inputPassword === correctPassword) {
        document.querySelector('form').hidden = false;
        document.getElementById('password-auth').hidden = true;
    } else {
        document.getElementById('auth-fail').hidden = false;
    }
}

//비밀번호 변경
document.addEventListener('DOMContentLoaded', () => {
    
});



//닉네임 중복확인 ajax


//관심장르 선택
document.addEventListener('DOMContentLoaded', () => {
    const genreLike = document.querySelector("input[name='genreLike']");
    const buttons = document.querySelectorAll('.btn-staez');

    updateInput();
    
    buttons.forEach(button => {
        button.addEventListener('click', (event) => {
            const button = event.currentTarget;
            const checkedButtons = document.querySelectorAll('.btn-staez.checked');
            console.log(checkedButtons.length);

            if (button.classList.contains('checked')) {
                button.classList.toggle('checked');
                updateInput();
            } else if (checkedButtons.length < 3) {
                button.classList.toggle('checked');
                updateInput();
            } else if((checkedButtons.length >= 3)){
                alert("최대 개수입니다.");
            }
        });
    });
    
    function updateInput() {
        const checkedButtons = document.querySelectorAll('.btn-staez.checked');
        const texts = Array.from(checkedButtons).map(button => button.innerText.trim());
        genreLike.value = texts.join(' ');
    }
});

//주소 불러오기 - kakao 우편번호 서비스 api (https://postcode.map.daum.net/guide)
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addressNormal").value = addr + extraAddr;

            } else {
                document.getElementById("addressNormal").value = addr;
            }

            // 상세주소 필드의 readonly옵션을 없애고, 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").readOnly = false;
            document.getElementById("addressDetail").focus();
        }
    }).open();
}

// 주소 필드 값 변경 시 호출되는 함수
function updateCombinedAddress() {
    const input1 =  document.getElementById("addressNormal").value;
    const input2 = document.getElementById("addressDetail").value;
    const address = document.querySelector("input[name='address']");

    address.value = input1 + " " + input2;
}

// 휴대폰번호 필드 값 변경 시 호출되는 함수
function updateCombinedPhone() {
    const input1 =  document.querySelector("#phone1").value;
    const input2 = document.querySelector("#phone2").value;
    const phone = document.querySelector("input[name='phone']");

    phone.value = "010" + input1 + input2;
}

// 이메일 필드 값 변경 시 호출되는 함수
function updateCombinedEmail() {
    const emailFront = document.getElementById('email-front').value;
    const emailBack = document.getElementById('email-back').value;
    const selectElement = document.querySelector("select[name='domain']");
    const combinedEmail = document.querySelector("input[name='email']");

    if (selectElement.value === 'self-input') {
        combinedEmail.value = emailFront + '@' + emailBack;
    } else {
        combinedEmail.value = emailFront + '@' + selectElement.value;
    }
}

//이메일 도메인 select설정
function emailDomain() {
    const selectElement = document.querySelector("select[name='domain']");
    const emailBack = document.getElementById('email-back');

    if (selectElement.value === 'self-input') {
        emailBack.removeAttribute('readonly');
        emailBack.value = '';
        emailBack.focus();        

    } else {
        emailBack.setAttribute('readonly', true);
        emailBack.value = selectElement.value;
    }

    updateCombinedEmail(); // Update combined email value whenever the domain changes
}


// 페이지가 로드되면 init 함수를 호출하여 초기 값을 설정
window.onload = init;