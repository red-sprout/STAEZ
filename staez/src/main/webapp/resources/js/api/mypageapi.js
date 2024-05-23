function dupliCheck(data, callback) {
    $.ajax({
        url : contextPath + 'dupliCheck.me',
        data,
        success : res => callback(res),
        error : () => {
            alert('중복체크에 실패하였습니다.');
        }
    })
}