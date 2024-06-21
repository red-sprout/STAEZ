$(function(){
    const boardNo = $('input[name=boardNo]').val();

    loadAnswerAjax({boardNo}, res => {
        const answer = $('#answer-section');
        console.log(res)
        if(res !== null){ //답변이 달렸을 때
            const answerDate = changeTimeFormat(res.boardWriteDate);
            $(answer).html(`<div class="header">
                                <span class="category"><h5>답변</h5></span>
                                <span class="title"><h3>${res.boardTitle}</h3></span>
                            </div>
                            <div class="content">${res.boardContent}</div>
                            <div class="date"><h5>${answerDate}</h5></div>`);
        } else{ //답변이 아직 없을 떄
            $(answer).html(`<div class="header">
                                <span class="category"><h5>답변</h5></span>
                                <span class="title">답변 대기중입니다...</span>
                                <span></span>                                 
                            </div>`);
            $('#answer-header').css('border', 'none');                
        }
    });
});

function changeTimeFormat(input) {
    const date = new Date(input);
    const year = String(date.getFullYear());
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    
    return `${year}-${month}-${day} ${hours}:${minutes}`;
}

function deleteInquire(){
    const boardNo = $('input[name=boardNo]').val();
    const result = confirm('삭제하시겠습니까?');
    if(!result){
        return;
    } else{
        deleteInquireAjax({boardNo:boardNo}, res => {
            if(res === 'NNNNY'){
                alert('삭제되었습니다');
                close();
  
            } else{
                alert('문의글 삭제에 실패하였습니다');
            }
        });        
    }
}