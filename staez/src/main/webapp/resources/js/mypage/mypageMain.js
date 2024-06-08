$(function(){
    loadMainPageAjax({tableType : 'myPayments'}, res => {
        const reserve = $('#reserve-td tbody');
        for (let i = 0; i < 5; i++) {
            if(res[i] == null){
                $(reserve).append(`<tr></tr>`);
            } else{
                const reserveDate = changeDateFormat(res[i].reserveDate);
                const concertDate = changeDateFormat(res[i].concertDate);
                $(reserve).append(`<tr>
                                        <td>${reserveDate}</td>
                                        <td align="left">${res[i].concertTitle}</td>
                                        <td>${concertDate}</td>
                                        <td>${res[i].tickets}</td>
                                    </tr>`);
            }
        }
        // const reserve = $('#reserve-td tbody');
        // $(res).each(function(index, myPayments){
        //     const reserveDate = changeDateFormat(myPayments.reserveDate);
        //     const concertDate = changeDateFormat(myPayments.concertDate);
            
        //     $(reserve).append(`<tr>
        //                         <td>${reserveDate}</td>
        //                         <td align="left">${myPayments.concertTitle}</td>
        //                         <td>${concertDate}</td>
        //                         <td>${myPayments.tickets}</td>
        //                     </tr>`);
        // });
    });

    loadMainPageAjax({tableType : 'myScrap'}, res => {
        const like = $('#like tbody');
        $(res).each(function(index, myScrap){
            $(like).append(`<tr onclick='location.href="${contextPath}/detail.co?concertNo=${myScrap.concertNo}"'>
                                <td class="long-td">[${myScrap.categoryName}] ${myScrap.concertTitle}</td>
                            </tr>`);
        });
    });

    loadMainPageAjax({tableType : 'myReview'}, res => {
        const review = $('#review tbody');
        $(res).each(function(index, myReview){
            $(review).append(`<tr>
                                <td class="long-td">${myReview.reviewContent}</td>
                                <td class="short-td">
                                    <span>
                                        <img src="${contextPath}/resources/img/mypage/star-filled.png">
                                        ${myReview.score}                                   
                                    </span>
                                </td>
                             </tr>`);
        });
    });

    loadMainPageAjax({tableType : 'myBoard'}, res => {
        const board = $('#my-board tbody');
        $(res).each(function(index, myBoard){
            const writeDate = changeDateFormat(myBoard.boardWriteDate);
            $(board).append(`<tr onclick='location.href="${contextPath}/detail.cm?boardNo=${myBoard.boardNo}"'>
                                <td class="long-td">${myBoard.boardTitle}</td>
                                <td class="short-td">${writeDate}</td>
                            </tr>`);
        });
    });

    loadMainPageAjax({tableType : 'myInquire'}, res => {
        const inquire = $('#my-inquire tbody');        
        $(res).each(function(index, myInquire){
            const writeDate = changeDateFormat(myInquire.boardWriteDate);
            $(inquire).append(`<tr>
                                    <td class="long-td">${myInquire.boardTitle}</td>
                                    <td class="short-td">${writeDate}</td>
                              </tr>`);
        });
    });
});

//날짜 포맷변경 함수
function changeDateFormat(input) {
    // 입력이 'July 8, 2024'와 같은 형식일 경우 처리
    const date = new Date(input);
    const year = String(date.getFullYear()).slice(-2);
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    
    return `${year}.${month}.${day}`;
}