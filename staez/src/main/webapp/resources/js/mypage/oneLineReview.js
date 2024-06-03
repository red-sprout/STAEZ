const starRating = _this => {
    const val = _this.value - 1;
    const starlist = document.querySelectorAll(".star-label .star-icon");

    for(let i = 0; i < 5; i++) {
        if(i > val) starlist[i].innerHTML = `<img src="./resources/img/mypage/star.png">`;
        else starlist[i].innerHTML = `<img src="./resources/img/mypage/star-filled.png">`;
    }
}

$(function() {
    // 이미 한줄평이 있을때 hover시 수정버튼 활성화
    $('#review-func').hover(function() {
        $('#review-func>span').prop('hidden', true);
        $('#review-func>span+button').prop('hidden', false);
    }, function(){
        $('#review-func>span').prop('hidden', false);
        $('#review-func>span+button').prop('hidden', true);
    });

    // 버튼 클릭 시 한줄평 작성 모달 출력
    $("#review-func>button").click(function() {
        
    });

});