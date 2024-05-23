// 닉네임 중복 체크
document.addEventListener('DOMContentLoaded', function() {
    const nicknameInput = document.querySelector("#nickname");
    const nicknameCheckButton = document.getElementById("nickNameCheckButton");
    const nicknameCheckResult = document.getElementById("checkResultNick");
    const nicknameErrorMessage = document.getElementById("nicknameErrorMessage");

    if (nicknameInput && nicknameCheckButton && nicknameCheckResult && nicknameErrorMessage) {
        nicknameCheckButton.addEventListener('click', function() {
            const str = nicknameInput.value;
            if (str.trim().length >= 1) {
                $.ajax({
                    url: "nickCheck.me",
                    data: { checkNick: str },
                    success: function (result) {
                        nicknameCheckResult.style.display = "block";
                        if (result === "NNNNN") {
                            nicknameCheckResult.style.color = "red";
                            nicknameCheckResult.innerText = "이미 사용중인 닉네임입니다.";
                            // 닉네임 입력 필드의 값을 없애기
                            nicknameInput.value = "";
                        } else {
                            nicknameCheckResult.style.color = "green";
                            nicknameCheckResult.innerText = "사용가능한 닉네임입니다.";
                        }
                    },
                    error: function () {
                        console.log("닉네임 중복체크 ajax 실패");
                    }
                });
            } else {
                nicknameCheckResult.style.display = "none";
            }
        });
    } else {
        console.log("닉네임 체크 요소 중 하나가 누락되었습니다.");
    }
});


// 사용자 아이디 중복 체크
document.addEventListener('DOMContentLoaded', function() {
    const userIdInput = document.querySelector("#userId");
    const userIdCheckButton = document.getElementById("idcheckButton");
    const userIdCheckResult = document.getElementById("checkResultId");
    const userIdErrorMessage = document.getElementById("userIdErrorMessage");

    if (userIdInput && userIdCheckButton && userIdCheckResult && userIdErrorMessage) {
        userIdCheckButton.addEventListener('click', function() {
            const str = userIdInput.value;
            if (str.trim().length >= 5) {
                $.ajax({
                    url: "idCheck.me",
                    data: { checkId: str },
                    success: function (result) {
                        userIdCheckResult.style.display = "block";
                        if (result === "NNNNN") {
                            userIdCheckResult.style.color = "red";
                            userIdCheckResult.innerText = "이미 사용중인 아이디입니다.";
                            // 닉네임 입력 필드의 값을 없애기
                            userIdInput.value = "";
                        } else {
                            userIdCheckResult.style.color = "green";
                            userIdCheckResult.innerText = "사용가능한 아이디입니다.";
                        }
                    },
                    error: function () {
                        console.log("아이디 중복체크 ajax 실패");
                    }
                });
            } else {
                userIdCheckResult.style.display = "none";
            }
        });
    } else {
        console.log("아이디 체크 요소 중 하나가 누락되었습니다.");
    }
});


// 비밀번호 관련 
var timeout; // 전역 범위에 timeout 변수를 선언합니다.

// 비밀번호 / 비밀번호 확인이 서로 틀릴 경우를 처리하는 함수
function validatePassword() {
    clearTimeout(timeout); // 이전에 예약된 작업이 있다면 취소합니다.

    timeout = setTimeout(function() {
        var password1 = document.getElementById("password1").value;
        var password2 = document.getElementById("password2").value;

        // 입력값이 모두 비어있으면 메시지를 숨깁니다.
        if (password1 === "" && password2 === "") {
            document.getElementById("passwordMessage").innerHTML = "";
            return;
        }

        // 비밀번호가 서로 다른 경우
        if (password1 !== password2) {
            document.getElementById("passwordMessage").innerHTML = "비밀번호가 다릅니다.";
            document.getElementById("passwordMessage").classList.remove("passwordCorrect");
            document.getElementById("passwordMessage").classList.add("passwordIncorrect");
        } else {
            // 비밀번호가 일치하는 경우
            // 비밀번호 유효성 검사: 영문, 숫자, 특수문자 포함, 8글자 이상
            var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
            if (!regex.test(password1)) {
                document.getElementById("passwordMessage").innerHTML = "비밀번호는 영문, 숫자, 특수문자를 모두 포함하여 8글자 이상이어야 합니다.";
                document.getElementById("passwordMessage").classList.remove("passwordCorrect");
                document.getElementById("passwordMessage").classList.add("passwordIncorrect");
            } else {
                document.getElementById("passwordMessage").innerHTML = "비밀번호가 일치합니다.";
                document.getElementById("passwordMessage").classList.remove("passwordIncorrect");
                document.getElementById("passwordMessage").classList.add("passwordCorrect");
            }
        }
    });
}

// 비밀번호 본인확인 버튼
// 비밀번호 클릭시 보이도록 (마우스가 눌린 상태에서만)
document.addEventListener("DOMContentLoaded", function() {
    let isMouseDown = false;
    
    // 비밀번호 클릭시 보이도록 (마우스가 눌린 상태에서만)
    function togglePasswordVisibility(inputId) {
        const inputField = document.getElementById(inputId);

        if (isMouseDown) {
            if (inputField.type === "password") {
                inputField.type = "text";
            } else {
                inputField.type = "password";
            }
        }
    }

    // 마우스 버튼이 눌린 상태인지 여부를 확인하여 상태 업데이트
    const pwdImgElement = document.getElementById("pwdImg");
    if (pwdImgElement) {
        pwdImgElement.addEventListener("mousedown", function() {
            isMouseDown = true;
            togglePasswordVisibility('password1');
        });
    } else {
        console.error("Element with id 'pwdImg' not found.");
    }

    // 마우스 버튼이 떼어진 상태인지 여부를 확인하여 상태 업데이트 및 비밀번호 가리기
    document.addEventListener("mouseup", function() {
        isMouseDown = false;
        const inputField = document.getElementById("password1");
        inputField.type = "password";
    });
});



// 핸드폰 번호 전송 처리
document.addEventListener('DOMContentLoaded', function() {
    const prefixElement = document.getElementById("phone-prefix");
    const suffix1Element = document.getElementById("phone-suffix1");
    const suffix2Element = document.getElementById("phone-suffix2");
    const inputValueElement = document.getElementById("input-value-phone");

    function updatePhoneNumber() {
        const prefix = prefixElement.innerText;
        const suffix1 = suffix1Element.value;
        const suffix2 = suffix2Element.value;
        const phoneNumber = prefix + suffix1 + suffix2;
        inputValueElement.value = phoneNumber;
    }

    suffix1Element.addEventListener('input', updatePhoneNumber);
    suffix2Element.addEventListener('input', updatePhoneNumber);
});

function sendPhoneNumber() {
    // input-value-phone 요소를 가져옵니다.
    var inputValueElement = document.getElementById("input-value-phone");
    if (!inputValueElement) {
        console.error("input-value-phone 요소를 찾을 수 없습니다.");
        return;
    }

    // phone-prefix 요소가 존재하는지 확인
    var prefixElement = document.getElementById("phone-prefix");
    if (!prefixElement) {
        console.error("phone-prefix 요소를 찾을 수 없습니다.");
        return;
    }

    // 010 부분 가져오기
    var prefix = prefixElement.innerText;

    // 각 번호 입력란의 값 가져오기
    var suffix1 = document.getElementById("phone-suffix1").value;
    var suffix2 = document.getElementById("phone-suffix2").value;

    // 전체 번호 조합하여 표시
    var phoneNumber = prefix + suffix1 + suffix2;
    console.log(phoneNumber); // 번호 확인용, 실제 사용시 주석처리해도 됩니다.

    // input-value-phone 필드에 번호 설정
    inputValueElement.value = phoneNumber;
}

// 이메일
document.addEventListener('DOMContentLoaded', function() {
    // 필요한 요소들을 가져옵니다.
    const prefixElement = document.getElementById("email-prefix");
    const suffixElement = document.getElementById("email-suffix");
    const domainList = document.getElementById("email-domain-list");
    const inputValueElement = document.getElementById("input-value-email"); // 수정된 부분

    // 이메일 주소를 업데이트하는 함수를 정의합니다.
    function updateEmail() {
        const prefix = prefixElement.value;
        const suffix = suffixElement.value;
        const domain = domainList.value;

        if (domain !== "type") {
            inputValueElement.value = prefix + "@" + domain;
        } else if (prefix && suffix) {
            inputValueElement.value = prefix + "@" + suffix;
        } else {
            inputValueElement.value = "";
        }
        console.log( prefix + "@" + domain)
    }

    // 도메인 리스트 변경 시 처리하는 함수를 정의합니다.
    function handleDomainListChange() {
        const selectedOption = domainList.options[domainList.selectedIndex].value;

        if (selectedOption !== "type") {
            suffixElement.value = selectedOption;
            suffixElement.placeholder = "";
            suffixElement.disabled = true;
        } else {
            suffixElement.value = "";
            suffixElement.placeholder = "직접 입력";
            suffixElement.disabled = false;
        }
        updateEmail(); // 이메일 업데이트 함수를 호출하여 이메일 값을 업데이트합니다.
    }

    // 초기화 함수를 정의합니다.
    function init() {
        handleDomainListChange(); // 도메인 리스트 변경 처리 함수를 호출합니다.
        prefixElement.addEventListener('input', updateEmail); // 프리픽스 입력 시 이메일 업데이트 함수를 호출합니다.
        suffixElement.addEventListener('input', updateEmail); // 서픽스 입력 시 이메일 업데이트 함수를 호출합니다.
        domainList.addEventListener('change', handleDomainListChange); // 도메인 리스트 변경 시 처리하는 함수를 호출합니다.
    }

    init(); // 페이지 로드 시 초기화 함수를 호출합니다.
});

// 입력 시 2초 후에 콘솔에 이메일 값을 출력하는 기능입니다.
let typingTimer;
document.addEventListener('DOMContentLoaded', function() {
    const emailInput = document.getElementById("email-prefix");
    const suffixInput = document.getElementById("email-suffix");

    emailInput.addEventListener('input', function() {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(function() {
            const emailPrefix = emailInput.value;
            const emailSuffix = suffixInput.value;
            console.log("입력된 이메일 아이디 값:", emailPrefix + "@" );
        }, 2000);
    });

    suffixInput.addEventListener('input', function() {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(function() {
            const emailPrefix = emailInput.value;
            const emailSuffix = suffixInput.value;
            console.log("입력된 이메일 주소 값:", emailPrefix + "@" + emailSuffix);
        });
    });
});

// 이메일 아이디적을때 한글안되고 영어만 가능하게
document.addEventListener('DOMContentLoaded', function() {
    const prefixElement = document.getElementById("email-prefix");
    const userEmailErrorMessage = document.getElementById("userEmailErrorMessage");

    prefixElement.addEventListener('input', function() {
        const value = prefixElement.value;
        const regex = /^[a-zA-Z0-9]*$/; // 영문자와 숫자만 허용하는 정규식

        if (!regex.test(value)) {
            // 입력된 값이 한글인 경우 빈 문자열로 대체하여 입력값을 영문만 포함하도록 합니다.
            prefixElement.value = value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');

            // userEmailErrorMessage에 영어 입력만 가능합니다 메시지 추가
            if (userEmailErrorMessage) {
                userEmailErrorMessage.innerText = "영어 입력만 가능합니다.";
                userEmailErrorMessage.style.color = "red";
            }
        } else {
            // 한글 입력이 아닐 때 에러 메시지를 초기화합니다.
            if (userEmailErrorMessage) {
                userEmailErrorMessage.innerText = "";
            }
        }
    });
});

// 우편번호 팝업 열기
function openPostalCodePopup() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 주소 입력란에 우편번호와 주소 채우기
            document.getElementById("addressInput").value = data.address;
        }
    }).open();
}

// 주소 확인
function updateAddressDisplay() {
    const addressInput = document.getElementById("addressInput");
    const detailAddressInput = document.getElementById("detailAddressInput");
    const addressDisplay = document.getElementById("input-value-address");

    if (addressInput && detailAddressInput && addressDisplay) {
        const addressValue = addressInput.value;
        const detailAddressValue = detailAddressInput.value;

        // 주소와 자세한 주소를 결합하여 주소 표시 요소에 설정
        const fullAddress = addressValue + " " + detailAddressValue;
        addressDisplay.value = fullAddress;

        // 콘솔에 출력
        console.log("주소 값:", fullAddress);
    }
}

function checkAddress() {
    updateAddressDisplay();
}

// 이전페이지로 돌아가는
document.addEventListener('DOMContentLoaded', function() {
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        //console.log("작동됨"); // 이 부분이 정상적으로 실행되지 않는다면 문제가 있을 수 있습니다.
        window.history.back();
    });
});

// 3개이상 못고르게하면서 값 출력되도록
document.addEventListener('DOMContentLoaded', function() {
    const genreLikeInput = document.querySelector("input[name='genreLike']");
    const buttons = document.querySelectorAll('.btn-staez3');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            if (button.classList.contains('selected')) {
                button.classList.remove('selected');
            } else {
                const selectedButtons = document.querySelectorAll('.btn-staez3.selected');
                if (selectedButtons.length < 3) {
                    button.classList.add('selected');
                } else {
                    // 선택 가능한 최대 개수를 초과한 경우 경고 메시지를 표시
                    alert("최대 갯수입니다.");
                }
            }
            updateInput();
        });
    });
    
    function updateInput() {
        const selectedButtons = document.querySelectorAll('.btn-staez3.selected');
        const selectedGenres = Array.from(selectedButtons).map(button => button.getAttribute('data-genre'));
        genreLikeInput.value = selectedGenres.join(' ');
    }
});

// "다음" 버튼 클릭 시 실행되는 함수
function saveFormDataToDB() {
    // form 요소 가져오기
    var form = document.getElementById("enrollForm");
    
    // form 안의 모든 input 요소 가져오기
    var inputsWithName = form.querySelectorAll("input[name]");
    
    // DB에 저장할 데이터를 담을 객체 생성
    var dataToSave = {};
    
    // input 요소들을 반복하면서 name 속성이 있는 것들의 값을 객체에 추가
    for (var i = 0; i < inputsWithName.length; i++) {
        dataToSave[inputsWithName[i].name] = inputsWithName[i].value;
    }
    
    // Ajax를 사용하여 서버에 데이터를 전송
    $.ajax({
        url: "insert.me", // 데이터를 저장할 서버의 URL
        type: "POST", // HTTP 요청 방식
        data: dataToSave, // 저장할 데이터
        success: function (response) {
            // 성공적으로 저장되었을 때 실행할 코드
            console.log("데이터가 성공적으로 저장되었습니다.");
            // 다음 작업 수행
        },
        error: function () {
            // 저장 중 오류가 발생했을 때 실행할 코드
            console.error("데이터 저장 중 오류가 발생했습니다.");
            // 오류 처리
        }
    });
}
