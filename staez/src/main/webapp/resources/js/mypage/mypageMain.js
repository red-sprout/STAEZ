$(function(){
    loadMainPageAjax({tableType : 'myPayments'}, res => {
        const reserve = $('#reserve-td tbody');
        for (let i = 0; i < 5; i++) {
            if(res[i] == null){
                $(reserve).append(`<tr></tr>`);
            } else{
                const reserveDate = changeTimeFormat(res[i].reserveDate);
                const concertDate = changeDateFormat(res[i].concertDate);
                const startTime = res[i].schedule.substr(0, 5);
                $(reserve).append(`<tr>
                                        <td><h5>${reserveDate}</h5></td>
                                        <td align="left" onclick="location.href='${contextPath}detail.co?concertNo=${res[i].concertNo}'">
                                            <h4>${res[i].concertTitle}</h4>
                                        </td>
                                        <td><h5>${concertDate} ${startTime}</h5></td>
                                        <td><h5>${res[i].tickets}</h5></td>
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
        for (let i = 0; i < 5; i++) {
            if(res[i] == null){
                $(like).append(`<tr></tr>`);
            } else{
                $(like).append(`<tr onclick='location.href="${contextPath}detail.co?concertNo=${res[i].concertNo}"'>
                                    <td class="long-td">
                                        <span class="font-purple">[${res[i].categoryName}]</span> 
                                        ${res[i].concertTitle}
                                    </td>
                                </tr>`);
            }
        }

        // $(res).each(function(index, myScrap){
        //     $(like).append(`<tr onclick='location.href="${contextPath}/detail.co?concertNo=${myScrap.concertNo}"'>
        //                         <td class="long-td">
        //                             <span class="font-purple">[${myScrap.categoryName}]</span> ${myScrap.concertTitle}
        //                         </td>
        //                     </tr>`);
        // });
    });

    loadMainPageAjax({tableType : 'myReview'}, res => {
        const review = $('#review tbody');
        for (let i = 0; i < 5; i++) {
            if(res[i] == null){
                $(review).append(`<tr></tr>`);
            } else{
                $(review).append(`<tr>
                                <td class="long-td">${res[i].reviewContent}</td>
                                <td class="short-td">
                                    <span>
                                        <img src="${contextPath}resources/img/mypage/star-filled.png">
                                        ${res[i].score}                                   
                                    </span>
                                </td>
                             </tr>`);
            }
        }

        // $(res).each(function(index, myReview){
        //     $(review).append(`<tr>
        //                         <td class="long-td">${myReview.reviewContent}</td>
        //                         <td class="short-td">
        //                             <span>
        //                                 <img src="${contextPath}/resources/img/mypage/star-filled.png">
        //                                 ${myReview.score}                                   
        //                             </span>
        //                         </td>
        //                      </tr>`);
        // });
    });

    loadMainPageAjax({tableType : 'myBoard'}, res => {
        const board = $('#my-board tbody');
        for (let i = 0; i < 5; i++) {
            if(res[i] == null){
                $(board).append(`<tr></tr>`);
            } else{
                const writeDate = changeDateFormat(res[i].boardWriteDate);
                $(board).append(`<tr onclick='location.href="${contextPath}detail.cm?boardNo=${res[i].boardNo}"'>
                                    <td class="long-td">${res[i].boardTitle}</td>
                                    <td class="short-td"><h5>${writeDate}</h5></td>
                                </tr>`);
            }
        }

        // $(res).each(function(index, myBoard){
        //     const writeDate = changeDateFormat(myBoard.boardWriteDate);
        //     $(board).append(`<tr onclick='location.href="${contextPath}/detail.cm?boardNo=${myBoard.boardNo}"'>
        //                         <td class="long-td">${myBoard.boardTitle}</td>
        //                         <td class="short-td">${writeDate}</td>
        //                     </tr>`);
        // });
    });

    loadMainPageAjax({tableType : 'myInquire'}, res => {
        const inquire = $('#my-inquire tbody');      
        for (let i = 0; i < 5; i++) {
            if(res[i] == null){
                $(inquire).append(`<tr></tr>`);
            } else{
                const writeDate = changeDateFormat(res[i].boardWriteDate);
                $(inquire).append(`<tr onclick='window.open("${contextPath}inquireDetail.me?boardNo=${res[i].boardNo}", "_blank", "width=800,height=700")'>
                                        <td class="long-td">${res[i].boardTitle}</td>
                                        <td class="short-td"><h5>${writeDate}</h5></td>
                                   </tr>`);
            }
        }
        
        // $(res).each(function(index, myInquire){
        //     const writeDate = changeDateFormat(myInquire.boardWriteDate);
        //     $(inquire).append(`<tr>
        //                             <td class="long-td">${myInquire.boardTitle}</td>
        //                             <td class="short-td">${writeDate}</td>
        //                       </tr>`);
        // });
    });
});

//날짜 포맷변경 함수
function changeDateFormat(input) {
    const date = new Date(input);
    const year = String(date.getFullYear()).slice(-2);
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    
    return `${year}.${month}.${day}`;
}

function changeTimeFormat(input) {
    const date = new Date(input);
    const year = String(date.getFullYear()).slice(-2);
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    
    return `${year}.${month}.${day} ${hours}:${minutes}`;
}