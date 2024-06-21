$(function(){
    const blist = $('input[name=blistLength]').val();
    if(blist > 0){
        $('.menu-item').each(function(index, item){
            const boardNo = $(item).find('input[name=boardNo]').val();
            const isAnswer = $(item).find('.isAnswer');
    
            console.log(boardNo)
            answerCheckAjax({boardNo : boardNo}, res => {
                if(res === 'NNNNN'){
                    $(isAnswer).text(`답변대기중`);
                } else {
                    $(isAnswer).text(`답변완료`);
                    $(isAnswer).addClass('complete');
                }
            });
    
        });
    }
});

function iquireDetailPage(boardNo){
    const contextPath = $('input[name=contextPath]').val();
    const url = contextPath + '/inquireDetail.me?boardNo=' + boardNo;
    const detailWindow = open(url, '_blank', "width=800, height=700, scrollbars=yes, resizable=no, location=no"); 
    detailWindow.onbeforeunload = function() { //onbeforeunloda : 창이나 탭이 닫히기전 발생하는 이벤트
        location.reload();
    };
}