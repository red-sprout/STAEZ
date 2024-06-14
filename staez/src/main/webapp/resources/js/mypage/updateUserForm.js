$(function() {
    enterKeyEventController()
    
    updateCombinedAddress()
    updateCombinedPhone()
    updateCombinedEmail()

    firstEmailDomain();
    firstLikeGenre();
    new PhoneVerification();
    new EmailVerification();
    changeCheck()
});

function enterKeyEventController() {    
    /*비밀번호 인증 enter키 허용*/
    // 버튼 클릭 이벤트
    $('#password-auth button').click(function() {
        authPassword();
    });

    // Enter 키 이벤트
    $('#pwdInput').keypress(function(event) {
        if (event.key === 'Enter') {
            authPassword();
        }
    });

    /*회원정보 변경 Submit, Enter키 제출 막기*/
    $('form').on('keydown', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 동작 취소
        }
    });
};

//닉네임, 휴대폰번호, 이메일의 값들 체킹
function changeCheck(){
    const originNickname = $('input[name=nickname]').val();
    const originPhone = $('input[name=phone]').val();
    const originEmail = $('input[name=email]').val();

    compare(originNickname, $('input[name=nickname]'), $('#nicknameCheck'));
    compare(originPhone, $('input[name=phone]'), $('#phoneCheck'));
    compare(originEmail, $('input[name=email]'), $('#emailCheck'));
}

//해당 요소의 값이 바꼈을때 해당 checkbox 해제
function compare(originValue, input, checkbox){ //본래값, 입력값, 체크박스
    input.on('change', function() {
        console.log(originValue);
        console.log(input)
        let currentValue = input.val();
        console.log('바뀜')
        // 이전 값과 현재 값 비교
        if (currentValue === originValue) {
            $(checkbox).prop('checked', true); // 값이 같으면 체크
        } else {
            $(checkbox).prop('checked', false); // 값이 다르면 체크 해제
        }
    });
}


//조건 만족해야지 form 제출되도록 함
function checkSubmitRequires() { //onclick
    const checkboxs = $('.submit-requires');
    let checkCount = 0;

    $(checkboxs).each(function(index, checkbox){
        if($(checkbox).is(':checked')){
            checkCount++;
        } else{
            switch($(checkbox).attr('id')){
                case 'nicknameCheck':
                    $('input[name=nickname]').focus();
                    break;
                case 'phoneCheck':
                    $('#phone1').focus();
                    break;
                case 'emailCheck':
                    $('#email-front').focus();
                    break;
            }
        }
    });

    if(checkCount === checkboxs.length){
        $('#profile form').submit(); // 폼 제출
    } 
}

// 회원정보 변경 전 비밀번호 인증
function authPassword() {
    const inputPwd = $('#pwdInput').val();
    console.log(inputPwd);

    authPwdAjax({inputPwd}, function(res) {
        if (res === 'NNNNY') { // 비밀번호 인증 성공
            $('form').prop('hidden', false);
            $('#password-auth').prop('hidden', true);
        } else {
            $('#auth-fail').prop('hidden', false);
        }
    });
}

//프로필 이미지 불러오기
$(function() {
    loadProfileImgAjax(function(res) {
        const profileImg = $('#profile-img>img');
        const profilePreview = $('#profile-preview');
        if(res.fileNo !== 0){
            if(res.changeName !== undefined){
                profileImg.attr('src', $('#contextPath').val() + res.filePath + res.changeName); 
                profilePreview.attr('src', $('#contextPath').val() + res.filePath + res.changeName); 
            } else{
                profileImg.attr('src', $('#contextPath').val() + res.filePath + 'basic_profile.jpg'); 
                profilePreview.attr('src', $('#contextPath').val() + res.filePath + 'basic_profile.jpg'); 
            }
        } else{
            profileImg.attr('src', $('#contextPath').val() + res.filePath + 'basic_profile.jpg'); 
            profilePreview.attr('src', $('#contextPath').val() + res.filePath + 'basic_profile.jpg');         }
    });
});

// 프로필 이미지 변경
$(function() {
    const profilePreview = $('#profile-preview'); // 프로필 이미지 미리보기

    const radioButtons = $(".img-tag input[type=radio]"); //radio 버튼들
    const closeButtons = $("#imgModal button[type=button]"); //닫기 버튼들
    const newImageInput = $("input[name=upfile]"); // 추가: 파일 인풋 요소 선택
    const newImageRadio = $(".img-tag input[value=newImg]"); //'변경할 이미지 선택' radio버튼

    let currentImageSrc; // 현재 적용되어 있던 이미지 경로
    loadProfileImgAjax(function(res) {
        console.log(res.changeName);
        if(res.fileNo !== 0){
            if(res.changeName !== undefined){
                currentImageSrc = $('#contextPath').val() + res.filePath + res.changeName; 
            } else{
                currentImageSrc = $('#contextPath').val() + res.filePath + 'basic_profile.jpg'; 
            }
        } else{
            currentImageSrc = $('#contextPath').val() + res.filePath + 'basic_profile.jpg'; 
        }
         
    });
    const defaultImageSrc = $(".img-tag input[type=hidden]").val(); // 기본 이미지 경로(hidden으로 숨겨서 스크립트에 넘겨줌)

    // 라디오 버튼 변경 시 이미지 미리보기 업데이트
    radioButtons.change(function() {
        if (this.value === 'currentImg') {
            profilePreview.attr('src', currentImageSrc);
            newImageInput.val('');
        } else if (this.value === 'defaultImg') {
            profilePreview.attr('src', defaultImageSrc);
            newImageInput.val('');
        } else if (this.value === 'newImg') {
            newImageInput.click();
        }
    });

    // 새 이미지 선택 시 이미지 미리보기 업데이트
    newImageInput.change(function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                profilePreview.attr('src', e.target.result);
            };
            reader.readAsDataURL(file);
            newImageRadio.prop('checked', true);
        }
    });

    // (프로필이미지 변경) 닫기, 취소 버튼 누르면 input들 초기화
    closeButtons.click(function() {
        radioButtons.first().prop('checked', true);
        profilePreview.attr('src', currentImageSrc); // 미리보기 이미지 선택값에 따라 변경
        newImageInput.val('');
    });
});


//닉네임 중복확인 ajax
function checkNickname(){
    const nickname = $('input[name=nickname]').val();
    const warningText = $('.warning-text h5');

    const reg = /^[a-zA-Z가-힣0-9]{2,16}$/;

    if (nickname.length < 2) {
        inputAlert(warningText, '2글자 이상 입력해주세요', 'red');
        $('#nickname').focus();
        return;
    } else if (!reg.test(nickname)) {
        inputAlert(warningText, '유효한 닉네임이 아닙니다', 'red');
        $('#nickname').focus();
        return;
    }

    console.log(nickname);
    dupliCheck({nickname: nickname}, (res) => {                
        if (res === 'NNNNN') { //중복닉네임이 있을 경우
            inputAlert(warningText, '중복된 닉네임이 존재합니다', 'red');
            $('#nickname').focus();        
        } else { //닉네임 사용이 가능할 경우
            inputAlert(warningText, '사용 가능한 닉네임입니다', 'green');
            $('#nicknameCheck').prop('checked', true);
        }
    });
}
//닉네임 유효성 확인 텍스트
function inputAlert(input, text, color){
    input.text(text).css('color', color);
}

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
                $('#addressNormal').val('[' + data.zonecode + '] ' + addr + extraAddr);

            } else {
                $('#addressNormal').val('[' + data.zonecode + '] ' + addr);
            }

            // 상세주소 필드의 readonly옵션을 없애고, 커서를 상세주소 필드로 이동한다.
            $('#addressDetail').val('').prop('readonly', false).focus();
        }
    }).open();
}

// 주소 필드 값 변경 시 호출되는 함수
function updateCombinedAddress() {
    const address = $('input[name=address]');
    const input1 =  $('#addressNormal').val();
    const input2 = $('#addressDetail').val();
    
    address.val(input1 + '/' + input2);
    console.log(address.val());
}

// 휴대폰번호 필드 값 변경 시 호출되는 함수
function updateCombinedPhone() {
    const phone = $('input[name=phone]');
    const input1 = $('#phone1').val();
    const input2 = $('#phone2').val();

    phone.val('010' + input1 + input2);
    phone.trigger('change'); //js로 value값을 변경시키면 event가 발생한다고 인식하지 않음(그래서 trigger 함수 추가로 실행)
}

// 이메일 필드값 변경 시 호출되는 함수
function updateCombinedEmail() {
    const email = $('input[name=email]');
    const emailFront = $('#email-front').val();
    const emailBack = $('#email-back').val();
    const selectElement = $('select[name=domain]');

    if (selectElement.val() === 'self-input') {
        email.val(emailFront + '@' + emailBack);
        email.trigger('change'); //js로 value값을 변경시키면 event가 발생한다고 인식하지 않음(그래서 trigger 함수 추가로 실행)
    } else {
        email.val(emailFront + '@' + selectElement.val());
        email.trigger('change');
    }
}

//이메일 도메인 select설정
function emailDomain() {
    const selectElement = $('select[name=domain]');
    const emailBack = $('#email-back');

    if (selectElement.val() === 'self-input') { //직접 입력 선택했을 때
        emailBack.prop('readonly', false);
        emailBack.val('');
        emailBack.focus();        
    } else {
        emailBack.prop('readonly', true);
        emailBack.val(selectElement.val());
    }

    updateCombinedEmail(); //언제든 이메일 도메인이 수정되면 업데이트됨
}

//처음 페이지 로드됐을 때 이메일 도메인 선택
function firstEmailDomain() {
    const options = $('select[name=domain] option');
    const emailBack = $('#email-back');

    options.each(function() {
        if ($(this).val() === emailBack.val()) { //직접입력일 때를 제외
            $(this).prop('selected', true);            
            emailBack.prop('readonly', true);
            return; 
        }
    });
}

//관심장르 선택
$(function() {
    const genreLike = $("input[name='genreLike']");
    const buttons = $(".genre-btn");

    updateInput();

    buttons.each(function() {
        $(this).on('click', function() {
            const currentButton = $(this);
            const checkedButtons = $(".genre-btn.checked");

            if (currentButton.hasClass('checked')) {
                currentButton.toggleClass('checked');
                updateInput();
            } else if (checkedButtons.length < 3) {
                currentButton.toggleClass('checked');
                updateInput();
            } else if (checkedButtons.length >= 3) {
                alert("최대 개수입니다.");
            }
        });
    });

    function updateInput() {
        const checkedButtons = $(".genre-btn.checked");
        const texts = checkedButtons.map(function() {
            return $(this).text().trim();
        }).get();
        genreLike.val(texts.join(' '));
    }
});

//처음 페이지 로드됐을 때 관심장르 체크
function firstLikeGenre(){
    const input = $('input[name=genreLike]');
    const buttons = $('.genre-btn');

    buttons.each(function() {
        const button = $(this);
        if (input.val().includes(button.text().trim())) {
            button.toggleClass('checked');
        }
    });
}

//휴대폰 인증 class
class PhoneVerification {
    constructor() {
        this.isSend = false; //인증번호 전송 여부
        this.authNo = ''; //인증번호
        this.timerId = null; //타이머(180초)
        this.timer = $(`.phone-section .timer>h4`); //타이머 UI
        this.input = $('.phone-section .auth-num-input'); //인증번호 input칸
        this.sendBtn = $('#phone-auth-btn'); //인증번호 전송 버튼
        this.authBtn = $('.phone-section button'); //인증번호 체크 버튼
      
        this.sendBtn.on('click', () => this.sendAuthNum()); 
        this.authBtn.on('click', () => this.checkAuthNum());
    }

    sendAuthNum() {
        if (this.isSend) {
            const result = confirm('재전송 하시겠습니까?')
            if(!result){
                return;
            } else{
                clearInterval(this.timerId);
            }
        }

        // 랜덤번호 생성
        this.authNo = Math.floor(100000 + Math.random() * 900000).toString().padStart(6, '0');
        const phone = $('input[name=phone]').val();

        $('#phoneCheck').prop('checked', false);

        sendPhoneAuthNoAjax({authNo: this.authNo, phone: phone}, res => {
            if (res === "NNNNY") {
                
                console.log('전송 성공');
                console.log('인증번호 : ' + this.authNo);
                console.log('전송한 휴대폰번호 : ' + phone);
                
                $('#phoneCheck').prop('checked', false);

                this.timer.css("color", "red")
                this.authBtn.prop('disabled', false);
                this.input.prop('readonly', false).val('').focus();

                this.isSend = true;
                this.startTimer(181); // 3분 타이머 시작
            } else{
                alert('전송 실패');
                this.authNo = '';
            }
        });
    }

    checkAuthNum() {
        const inputCode = this.input.val();
        if (this.authNo !== inputCode) {
            alert('잘못된 인증번호입니다.');
        } else {
            $('#phoneCheck').prop('checked', true);
            this.sendBtn.prop('disabled', true);
            $('#phone1').prop('readonly', true);
            $('#phone2').prop('readonly', true);

            alert('인증성공');
            clearInterval(this.timerId);

            this.input.prop('readonly', true);            
            this.timer.css("color", "#4aa500")
            this.isSend = false;
            this.authBtn.prop('disabled', true);
        }
    }

    startTimer(duration) {
        let timeLeft = duration;
        this.timerId = setInterval(() => {
            if (timeLeft <= 0) {
                clearInterval(this.timerId);
                alert('인증시간이 초과되었습니다. 다시 인증해주세요.');
                this.timer.text('3:01');
                this.authBtn.prop('disabled', true);
                this.authNo = '';
                this.isSend = false; // 타이머가 끝나면 isSend를 다시 false로 설정
            } else {
                timeLeft--;
                let minutes = Math.floor(timeLeft / 60);
                let seconds = timeLeft % 60;
                this.timer.text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
            }
        }, 1000);
    }
}


//이메일 인증 class
class EmailVerification {
    constructor() {
        this.isSend = false; //인증번호 전송 여부
        this.authNo = ''; //인증번호
        this.timerId = null; //타이머(180초)
        this.timer = $(`.email-section .timer>h4`); //타이머 UI
        this.input = $('.email-section .auth-num-input'); //인증번호 input칸
        this.sendBtn = $('#email-auth-btn'); //인증번호 전송 버튼
        this.authBtn = $('.email-section button'); //인증번호 체크 버튼
      
        this.sendBtn.on('click', () => this.sendAuthNum()); 
        this.authBtn.on('click', () => this.checkAuthNum());
    }
        
    sendAuthNum() {
        if (this.isSend) {
            const result = confirm('재전송 하시겠습니까?')
            if(!result){
                return;
            } else{
                clearInterval(this.timerId);
            }
        }

        // 랜덤번호 생성
        this.authNo = Math.floor(100000 + Math.random() * 900000).toString().padStart(6, '0');
        const email = $('input[name=email]').val();

        $('#emailCheck').prop('checked', false);

        sendEmailAuthNoAjax({authNo: this.authNo, email: email}, res => {
            if (res === "NNNNY") {                
                console.log('전송 성공');
                console.log('인증번호 : ' + this.authNo);
                console.log('전송한 이메일 : ' + email);
                
                $('#emailCheck').prop('checked', false);

                this.timer.css("color", "red")
                this.authBtn.prop('disabled', false);
                this.input.prop('readonly', false).val('').focus();

                this.isSend = true;
                this.startTimer(181); // 3분 타이머 시작
            } else{
                alert('전송 실패');
                this.authNo = '';
            }
        });
    }

    checkAuthNum() {
        const inputCode = this.input.val();
        if (this.authNo !== inputCode) {
            alert('잘못된 인증번호입니다.');
        } else {
            $('#phoneCheck').prop('checked', true);
            this.sendBtn.prop('disabled', true);
            $('#phone1').prop('readonly', true);
            $('#phone2').prop('readonly', true);

            alert('인증성공');
            clearInterval(this.timerId);

            this.input.prop('readonly', true);            
            this.timer.css("color", "#4aa500")
            this.isSend = false;
            this.authBtn.prop('disabled', true);
        }
    }

    startTimer(duration) {
        let timeLeft = duration;
        this.timerId = setInterval(() => {
            if (timeLeft <= 0) {
                clearInterval(this.timerId);
                alert('인증시간이 초과되었습니다. 다시 인증해주세요.');
                this.timer.text('3:01');
                this.authBtn.prop('disabled', true);
                this.authNo = '';
                this.isSend = false; // 타이머가 끝나면 isSend를 다시 false로 설정
            } else {
                timeLeft--;
                let minutes = Math.floor(timeLeft / 60);
                let seconds = timeLeft % 60;
                this.timer.text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
            }
        }, 1000);
    }
}


//회원탈퇴 기능
function withdrawalAuth() { //onclick
    
    const submitBtn = $("#withdrawalModal button[type='submit']");
    const inputPwd = $(".withdrawal-tag input[type='password']").val();

    authPwdAjax({inputPwd}, res => {
        if (res === 'NNNNY') { //비밀번호 인증 성공            
            submitBtn.prop('disabled', false);            
        } else {
            alert("비밀번호가 일치하지 않습니다");
        }
    });
}



/* 아래부터는 js, jQuery로 변경 예정 */

// 비밀번호 변경
// 비밀번호 입력때마다 유효성 확인
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

    const submit = document.querySelector("#pwdModal button[type='submit']");
    if(combineCheck * differCheck){
        submit.disabled = false;
        return;
    }
    submit.disabled = true;
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
function cancelUpdatePwd() {
        const pwdForm = document.querySelector("#pwdModal form"); //pwd변경 form
        const warnings = document.querySelectorAll("#pwdModal h5");
    
        warnings.forEach(warning => {
            warning.innerText = '';
        });
        pwdForm.reset();
}

// 페이지가 로드되면 init 함수를 호출하여 초기 값을 설정
window.onload = init;