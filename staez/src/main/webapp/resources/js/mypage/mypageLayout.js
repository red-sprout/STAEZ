$(function() {
    const contentPage = $(".main-section input[type='hidden']").val();
    const menus = $("li>a");

    menus.each(function() {
        if ($(this).attr('id') === contentPage) {
            $(this).css('color', '#b51b75');
            return false;
        }
    });
});

//프로필 이미지 불러오기
$(function() {
    loadProfileImgAjax(function(res) {
        const profileImg = $('.profile img');
        if(res.fileNo !== 0){
            if(res.changeName !== undefined){
                profileImg.attr('src', $('#contextPath').val() + res.filePath + res.changeName); 
            } else{
                profileImg.attr('src' , $('#contextPath').val() + res.filePath + 'profile_img_default.png'); 
            }
        } else{
            profileImg.attr('src' , $('#contextPath').val() + res.filePath + 'profile_img_default.png'); 
        }
    });
});