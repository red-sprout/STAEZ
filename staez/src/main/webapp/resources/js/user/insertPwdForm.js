document.addEventListener('DOMContentLoaded', function() {
    var changeButton = document.getElementById('changeButton');
    changeButton.addEventListener('click', function() {
        // 비밀번호 확인
        var newPassword = document.getElementById('newPassword').value;
        var confirmNewPassword = document.getElementById('confirmNewPassword').value;

        if (newPassword === confirmNewPassword) {
            // 변경 성공 모달 열기
            $('#myModal').modal('show');
        } else {
            // 변경 실패 모달 열기
            $('#failureModal').modal('show');
        }
    });
});
