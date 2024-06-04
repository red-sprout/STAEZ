const starRating = value => {
    const val = value - 1;
    const starlist = $(".star-label .star-icon");

    starlist.each(function(index) {
        if(index > val) {
            $(this).html('<img src="./resources/img/mypage/star.png">');
        } else {
            $(this).html('<img src="./resources/img/mypage/star-filled.png">');
        }
    });
}

$(function() {
    // 별 클릭하면 starRating 함수 호출
    $('.star-icon').click(function() {
        const value = $(this).parent().find('input[type="radio"]').val(); // 클릭된 요소(span)의 부모에서 자식을 다치 찾음
        console.log('클릭한 별 value : ' + value);
        
        starRating(value); // starRating 함수 호출하고 데이터 값을 전달
    });

    // 이미 한줄평이 있을때 hover시 수정버튼 활성화
    $('.review-func').each(function() {
        $(this).hover(function() {
            $(this).find('span').prop('hidden', true);
            $(this).find('span+button').prop('hidden', false);
        }, function() {
            $(this).find('span').prop('hidden', false);
            $(this).find('span+button').prop('hidden', true);
        });
    });

});

// 버튼 클릭 시 한줄평 작성 모달 출력
function loadOneLineReview(concertNo){
    loadOneLineReviewAjax({concertNo}, function(res){
        const table = $('.concert-tag>table>tbody');
        const reviewContent = $('textarea');
        table.html(`<tr>
                        <td rowspan="4">
                            <img src="${contextPath}${res.filePath}${res.changeName}">
                        </td>
                    </tr>
                    <tr>
                        <td><h2>${res.concertTitle}</h2></td>
                    </tr>
                    <tr>
                        <td><h3>${res.theaterName}</h3></td>
                    </tr>
                    <tr>
                        <td><h4>출연진 : ${res.concertMembers}</h4></td>
                    </tr>`);

        //받아온 별점 ui적용
        starRating(res.score);
        
        //리뷰 내용이 있었으면 받아오기
        reviewContent.val(res.reviewContent);

        $('input[name=reviewNo]').val(res.reviewNo);
        $('input[name=concertNo]').val(res.concertNo);
    });
}

// 닫기 버튼 클릭시 모달안의 값들 초기화
function closeModal(){
    const table = $('.concert-tag>table>tbody');
    const reviewContent = $('textarea');

    table.html('');
    reviewContent.val('');
    starRating(0);
}