$(function() {
    // 모든 메뉴 아이템에 클릭 이벤트 추가
    $('.menu-item').click(function() {
        // 현재 클릭된 메뉴 아이템을 제외한 모든 하위 메뉴 숨기기
        $('.menu-item .fold-content').not($(this).find('.fold-content')).hide();
        // 모든 이미지의 src를 초기 이미지로 변경
        $('.menu-item img').attr('src', 'path/to/default/image.png');
        
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


    
    // const boardNo = $('input[name=inquireBoardNo]');
    // $('.answer>.fold-content').each(function(index, answer){
    //     loadAnswerAjax(boardNo[index], (res) => {
    //         console.log(boardNo[index]);
    //         console.log(res.boardContent);
    //         if(res.boardContent === null){
    //             answer.html(`답변을 기다리는 중입니다...`);
    //         } else{
    //             answer.html(`${res.boardContent}`);
    //         }
    //     });

    // });
});

$(document).ready(function() {
    const boardNo = $('input[name=inquireBoardNo]').map(function() {
        return $(this).val();
    }).get();

    $('.answer>.fold-content').each(function(index, answer) {
        const currentAnswer = $(answer);  // jQuery 객체로 변환
        loadAnswerAjax(boardNo[index], (res) => {
            console.log(boardNo[index]);
            console.log(res.boardContent);
            if (res.boardContent === null) {
                currentAnswer.html('답변을 기다리는 중입니다...');
            } else {
                currentAnswer.html(res.boardContent);
            }
        });
    });
});