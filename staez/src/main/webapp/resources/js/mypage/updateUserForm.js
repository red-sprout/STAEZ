

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

// 비밀번호 변경
function checkPassword(){
    const newPwd = document.getElementById('changePwd'); // 변경할 비밀번호 input
    const checkPwd = document.getElementById('checkPwd'); //비밀번호 확인 input
    const warning1 = document.querySelectorAll('.pwd-check>h5')[0]; //비밀번호 조합 확인 div
    const warning2 = document.querySelectorAll('.pwd-check>h5')[1]; //비밀번호 일치 체크 div                             

    const combineCheck = combinePwd(newPwd, warning1);
    const differCheck = differPwd(newPwd, checkPwd, warning2);

    console.log(newPwd.value);
    console.log(checkPwd.value);

    console.log(combineCheck, differCheck)
}

function combinePwd(targetInput, warning1){ //새로운 비밀번호 조합 확인
    const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,30}$/;
    
    if(reg.test(targetInput.value) || targetInput.value === ""){ //비밀번호의 조합조건이 맞거나 빈칸일 경우
        warning1.innerText = '';
        return targetInput.value !== ""; //값이 비어있는 것은 combinePwd조건에 만족은 아니다
        //값이 비어있을 경우 false, 값이 있으면 true

    } else {
        warning1.innerText = '올바르지 못한 형식입니다';
        return false;
    } 
}

function differPwd(originInput, checkInput, warning2){ //비밀번호 일치 체크
    if(originInput.value === checkInput.value || checkInput.value === ""){ //비밀번호가 일치하거나 빈칸일 경우
        warning2.innerText = '';
        return checkInput.value !== ""; //값이 비어있는 것은 differPwd조건에 만족은 아니다
       
    } else{
        warning2.innerText = '비밀번호가 일치하지 않습니다';
        return false;
    }
}

//(비밀번호 변경) 닫기, 취소 버튼누르면 input들 초기화
document.addEventListener('DOMContentLoaded', () => {
    const cancelBtns = document.querySelectorAll("#pwdModal button[type='button']"); //닫기, 취소 버튼
    const pwdForm = document.querySelector("#pwdModal form"); //pwd변경 form
    const warnings = document.querySelectorAll("#pwdModal h5");

    cancelBtns.forEach(button => {
        button.addEventListener('click', function(){
            warnings.forEach(warning => {
                warning.innerText = '';
            });
            pwdForm.reset();
        });
    });
});

//닉네임 중복확인 ajax
function checkNickname(){
    const nickname = document.querySelector("input[name='nickname']");
    const warningText = document.querySelectorAll('.warning-text h5')[0];
    
    dupliCheck({nickname: nickname.value}, (res) => {
        console.log(warningText);
        console.log(nickname.value);
        //중복닉네임이 있을 경우
        if(res === 'NNNNN'){
            warningText.innerText = '중복된 닉네임이 존재합니다';
            warningText.style.color = 'red';
            nickname.focus();
        } else {
            //닉네임 사용이 가능할 경우
            warningText.innerText = "사용가능한 닉네임입니다.";
            warningText.style.color = 'green';
        }
    });

}

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
                document.getElementById("addressNormal").value = '[' + data.zonecode + '] ' + addr + extraAddr;

            } else {
                document.getElementById("addressNormal").value = '[' + data.zonecode + '] ' + addr;
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





/*
//프로필 사진 변경
const profilePic = document.getElementById('profile-pic');
const newImageInput = document.getElementById('new-image-input');
const saveButton = document.getElementById('save-button');

const currentProfilePicSrc = 'current-profile.jpg';
const defaultProfilePicSrc = 'default-profile.jpg';
let newProfilePicSrc = '';

document.querySelectorAll('input[name="profile-option"]').forEach((input) => {
    input.addEventListener('change', (event) => {
        const value = event.target.value;
        if (value === 'current') {
            profilePic.src = currentProfilePicSrc;
        } else if (value === 'default') {
            profilePic.src = defaultProfilePicSrc;
        } else if (value === 'new') {
            newImageInput.click();
        }
    });
});

newImageInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            newProfilePicSrc = e.target.result;
            profilePic.src = newProfilePicSrc;
        };
        reader.readAsDataURL(file);
    }
});

saveButton.addEventListener('click', () => {
    const selectedOption = document.querySelector('input[name="profile-option"]:checked').value;
    if (selectedOption === 'current') {
        alert('현재 프로필 이미지로 설정되었습니다.');
    } else if (selectedOption === 'default') {
        alert('기본 이미지로 설정되었습니다.');
    } else if (selectedOption === 'new' && newProfilePicSrc) {
        alert('새로운 이미지로 설정되었습니다.');
    } else {
        alert('이미지가 선택되지 않았습니다.');
    }
});

*/



// 페이지가 로드되면 init 함수를 호출하여 초기 값을 설정
window.onload = init;