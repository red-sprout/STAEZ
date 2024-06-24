$(function(){
    // loadMyPayments().then(payments => {
    //     deposit(payments);
    // });    
    loadMyPayments();
    loadMyScrap();
    loadMyReview();
    loadMyBoard();
    loadMyInquire();

});

function loadMyPayments(){
    // return new Promise((resolve, reject) => {

    loadMainPageAjax({tableType : 'myPayments'}, res => {
        const reserve = $('#reserve-td tbody');
        if(res.length > 0){
            for (let i = 0; i < 5; i++) {
                if(res[i] == null){
                    $(reserve).append(`<tr></tr>`);
                } else{
                    const reserveDate = changeTimeFormat(res[i].reserveDate);
                    $(reserve).append(`<tr>
                                            <td><h5>${reserveDate}</h5></td>
                                            <td align="left" onclick="location.href='${contextPath}detail.co?concertNo=${res[i].concertNo}'">
                                                <h4>${res[i].concertTitle}</h4>
                                            </td>
                                            <td><h5>${res[i].tickets}</h5></td>
                                            <td>
                                                <span>
                                                    ${res[i].payMethod === '카카오페이' || res[i].reserveStatus === 'Y' ? 
                                                        '<h5>결제완료</h5>' : '<h5 class="pay-yet">결제대기중</h5>'}
                                                </span>
                                            </td>
                                        </tr>`);
                }
            }
        } else {
            $(reserve).append(`<tr>
                                    <td colspan=4 class="empty">
                                    나의 예매 내역이 없습니다
                                    </td>
                                </tr>`);
        }

        //     resolve(res); // res 값을 반환
        // });
    });
}

function loadMyScrap(){
    loadMainPageAjax({tableType : 'myScrap'}, res => {
        const like = $('#like tbody');
        if(res.length > 0){
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
        } else{
            $(like).append(`<tr>
                <td colspan=2 class="empty">
                  나의 찜목록이 없습니다
                </td>
             </tr>`);
        }
    });
}

function loadMyReview(){
    loadMainPageAjax({tableType : 'myReview'}, res => {
        const review = $('#review tbody');
        if(res.length > 0){
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
        } else {
            $(review).append(`<tr>
                <td colspan=2 class="empty">
                  나의 한줄평이 없습니다
                </td>
             </tr>`);
        }
    });
}

function loadMyBoard(){
    loadMainPageAjax({tableType : 'myBoard'}, res => {
        const board = $('#my-board tbody');
        if(res.length > 0){
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
        } else{
            $(board).append(`<tr>
                <td colspan=2 class="empty">
                  나의 작성글이 없습니다
                </td>
             </tr>`);
        }
    });
}

function loadMyInquire(){
    loadMainPageAjax({tableType : 'myInquire'}, res => {
        const inquire = $('#my-inquire tbody');  
        if(res.length > 0){
            for (let i = 0; i < 5; i++) {
                if(res[i] == null){
                    $(inquire).append(`<tr></tr>`);
                } else{
                    const writeDate = changeDateFormat(res[i].boardWriteDate);
                    $(inquire).append(`<tr onclick='openDetail("${contextPath}inquireDetail.me?boardNo=${res[i].boardNo}")'>
                                            <td class="long-td">${res[i].boardTitle}</td>
                                            <td class="short-td"><h5>${writeDate}</h5></td>
                                       </tr>`);
                }
            }
        } else{
            $(inquire).append(`<tr>
                <td colspan=2 class="empty">
                  나의 문의글이 없습니다
                </td>
             </tr>`);
        }
    });
}

// function deposit(payments){
//     $(document).on('click', '.pay-btn', function(){
//         const btn = $(this);
//         const index = btn.closest('tr').index(); // 클릭된 버튼이 속한 행의 인덱스를 가져옴
//         const payment = payments[index]; // 해당 인덱스의 payments 배열 요소를 가져옴
        
//         console.log(payment); // 특정 인덱스의 payment 데이터 출력

//         const result = confirm('결제하시겠습니까?');
//         if(result){
//             depositAjax(payment, res => {
//                 if(res === 'success'){
//                     alert('결제되었습니다.');
//                 } else{
//                     alert('결제실패');
//                 }
//             });
//         } 
//     });
// }

function refreshParent() {
    location.reload();
}

function openDetail(url) {
    open(url, "_blank", "width=800,height=700,resizable=no,location=no");
    // detailWindow.onbeforeunload = function() { //onbeforeunloda : 창이나 탭이 닫히기전 발생하는 이벤트
    //     location.reload();
    // };
}

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