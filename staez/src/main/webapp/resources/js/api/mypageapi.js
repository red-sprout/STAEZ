function dupliCheck(data, callback) {
    $.ajax({
        url : contextPath + 'dupliCheck.me',
        data,
        success : res => callback(res),
        error : () => {
            alert('중복체크에 실패하였습니다');
        }
    })
}

function authPwdAjax(data, callback) {
    $.ajax({
        url: contextPath + 'authPwd.me',
        data,
        success: res => callback(res),
        error: () => {
            alert('비밀번호 확인에 실패하였습니다');
        }
    });
}

function loadProfileImgAjax(callback) {
    $.ajax({
        url: contextPath + 'loadImg.me',
        dataType: 'json', 
        success: res => callback(res),
        error: () => {
            alert('프로필사진을 불러오는데 실패하였습니다');
        }
    });
}


