$(function() {
    // 모든 메뉴 아이템에 클릭 이벤트 추가
    $('.menu-item').click(function() {
        // 현재 클릭된 메뉴 아이템을 제외한 모든 하위 메뉴 숨기기
        $('.menu-item .fold-content').not($(this).find('.fold-content')).hide();
        // 모든 이미지의 src를 초기 이미지로 변경
        $('.menu-item img').attr('src', './resources/img/inquire/up.png');
        
        // 현재 클릭된 메뉴 아이템의 하위 메뉴를 토글
        const subMenu = $(this).find('.fold-content');
        const img = $(this).find('img'); // 클릭된 메뉴 아이템 내의 이미지 태그

        if (subMenu.is(':visible')) {
            subMenu.hide();
            img.attr('src', './resources/img/inquire/up.png'); // 토글하여 숨길 때 이미지 변경
        } else {
            subMenu.show();
            img.attr('src', './resources/img/inquire/down.png'); // 토글하여 보일 때 이미지 변경
        }
    });


    
    $('input[name="inquireBoardNo"]').each(function() {
        const boardNo = $(this).val(); // 현재 input 요소의 값을 가져옴
        const currentAnswer = $(this).closest('.answer').find('.fold-content'); // 해당 input 요소의 .answer > .fold-content 요소를 찾음
        const answerDate = $(this).closest('.answer').find('.fold-answer-date');

        loadAnswerAjax({boardNo: boardNo} , function(res) {
            console.log('문의번호 : ' + boardNo);
            
            let date;
            if(res !== null){
                console.log('res: (' + res.boardWriteDate + ')' + res.boardContent);
                date = new Date(res.boardWriteDate).toISOString().split('T');
            }


            currentAnswer.html(res === null ? '답변을 기다리는 중입니다...' : res.boardContent);
            answerDate.html(res === null ? '' : `<h5> ${date[0]} ${date[1].substring(0, 8)} </h5>`);
        });
    });
});
