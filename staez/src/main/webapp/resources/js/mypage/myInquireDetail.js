$(function(){
    const boardNo = $('input[name=boardNo]').val();

    loadAnswerAjax({boardNo}, res => {
        const answer = $('#answer-section');
        console.log(res)
        if(res !== null){ //답변이 달렸을 때
            $(answer).html(`<div id="answer-header">
                                <span id="answer-category">답변</span>
                                <span id="answer-title">${res.boardTitle}</span>
                                <span id="answer-date">${res.boardWriteDate}</span>
                            </div>
                            <div id="answer-content">
                                ${res.boardContent}
                            </div>`);
        } else{ //답변이 아직 없을 떄
            $(answer).html(`<div id="answer-header">
                                <span id="answer-category">답변</span>
                                <span id="answer-title">답변 대기중입니다...</span>
                                <span id="answer-date"></span>                                 
                            </div>`);
            $('#answer-header').css('border', 'none');                
        }
    });
});