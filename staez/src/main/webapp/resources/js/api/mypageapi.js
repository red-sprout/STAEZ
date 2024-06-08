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

function deleteMyScrapAjax(data, callback){
    $.ajax({
        url: contextPath + 'deleteMyScrap.me',
        data,
        success: res => callback(res),
        error: () => {
            alert('찜목록 삭제에 실패하였습니다');
        }
    });
}

function loadOneLineReviewAjax(data, callback){
    $.ajax({
        url: contextPath + 'loadReview.me',
        data,
        dataType: 'json', 
        success: res => callback(res),
        error: () => {
            alert('한줄평을 불러오는데 실패하였습니다');
        }
    });
}

function loadAnswerAjax(data, callback){
    $.ajax({
        url: contextPath + 'loadAnswer.me',
        data,
        dataType: 'json', 
        success: res => callback(res),
        error: () => {
            alert('문의 답변을 불러오는데 실패하였습니다');
        }
    });
}

function loadMainPageAjax(data, callback){
    $.ajax({
        url: contextPath + 'loadMainPageAjax.me',
        data,
        dataType: 'json', 
        success: res => callback(res),
        error: () => {
            alert(data + '를 불러오는데 실패하였습니다');
        }
    });
}