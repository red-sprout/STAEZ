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

function starRating(value) { //value(별점)만큼 별UI 표현
    const val = value - 1;
    const starlist = $(".star-label .star-icon");
    const starPath = "./resources/img/mypage/star.png";
    const filledStarPath = "./resources/img/mypage/star-filled.png";
    const submit = $('button[type=submit]');

    starlist.each(function(index) {
        if(index > val) {
            $(this).html(`<img src=${starPath}>`);
        } else {
            $(this).html(`<img src=${filledStarPath}>`);
        }
    });

     if(value > 0){
        submit.prop('disabled', false);
     } else{
        submit.prop('disabled', true);
     }
}

// 버튼 클릭 시 한줄평 작성 모달 출력
function loadOneLineReview(concertNo){
    loadOneLineReviewAjax({concertNo}, function(res){
        const div = $('.concert-tag');
        const tbody = $('.concert-tag>table>tbody');
        const reviewContent = $('textarea');

        div.on('click',  function() {
            const url = `${contextPath}/detail.co?concertNo=${res.concertNo}`;
            location.href = url;
        });

        tbody.html(`<tr>
                        <td rowspan="3">
                            <img src="${contextPath}${res.filePath}${res.changeName}">
                        </td>
                        <td><h2>${res.concertTitle}</h2></td>
                    </tr>
                    <tr>
                        <td><h3>${res.theaterName}</h3></td>
                    </tr>
                    <tr>
                        <td><h4>출연진 : ${res.concertMembers}</h4></td>
                    </tr>`);            
        
        if(res.reviewStatus === 'Y'){
             //받아온 별점 radio체크
            $('input[name=score]').each(function(index, radio){
                //radio.value =>string
                //res.score => number
                if(Number(radio.value) === res.score){
                    $(radio).prop("checked", true); 
                }
            });

            //받아온 별점 ui적용
            starRating(res.score);
            
            //리뷰 내용이 있었으면 받아오기
            reviewContent.val(res.reviewContent);
        }       

        $('input[name=reviewNo]').val(res.reviewNo);
        $('input[name=concertNo]').val(res.concertNo);        
    });
}

// 한줄평 삭제
function deleteOneLineReview(){
    const result = confirm('한줄평을 삭제하시겠습니까?');
    if(result){
        //한줄평 삭제하고 다시 페이지로드
        const reviewNo = $('input[name=reviewNo]').val()
        console.log(reviewNo)
        deleteOneLineReviewAjax({reviewNo}, res => {
            if(res == 'success'){
                alert('삭제되었습니다.');
                location.href = 'reviewList.me?cpage=1';
            } else{
                alert('삭제에 실패하였습니다.');
            }
        });
    }



}

// 닫기 버튼 클릭시 모달안의 값들 초기화
function closeModal(){
    const table = $('.concert-tag>table>tbody');
    const reviewContent = $('textarea');

    table.html('');
    reviewContent.val('');
    starRating(0);
}