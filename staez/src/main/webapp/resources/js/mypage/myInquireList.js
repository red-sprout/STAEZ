$(function(){
    $('.menu-item').each(function(index, item){
        const boardNo = $(item).find('input[name=boardNo]').val();
        const isAnswer = $(item).find('.isAnswer');

        answerCheckAjax({boardNo : boardNo}, res => {
            if(res === 'NNNNN'){
                $(isAnswer).text(`답변대기중`);
            } else {
                $(isAnswer).text(`답변완료`);
                $(isAnswer).addClass('complete');
            }
        });

    });
});

function iquireDetailPage(boardNo){
    const contextPath = $('input[name=contextPath]').val();
    const url = contextPath + '/inquireDetail.me?boardNo=' + boardNo;
    open(url, '_blank', "width=800, height=700, scrollbars=yes, resizable=no, location=no"); 
}
