$(function(){
    reserveDetail();
    insertAlphabet();
});


function insertAlphabet() {    
    const seatNo = $('.seat-no');
    $(seatNo).each(function() {
        const row = $(this).find('input[name=row]').val();
        const col = $(this).find('input[name=col]').val();
        const seat = $(this).find('input[name=seat]').val();
        console.log('row : ' + row);
        console.log('col : ' + col);

        const alphabet = convertToAlphabet(parseInt(row), col); // 수정: row, col을 정수로 변환하여 함수에 전달
        $(this).text(`좌석 : ${seat}석 ${alphabet}`);
    });
}

function convertToAlphabet(row, col) {
    let result = '';
    // Convert row number to alphabet (A, B, C, ..., AA, AB, AC, ...)
    while (row > 0) {
        row--; // Adjust for zero-indexing
        result = String.fromCharCode(65 + (row % 26)) + result;
        row = Math.floor(row / 26);
    }
    return `${result}${col}`;
}

function iquireDetailPage(boardNo){
    const contextPath = $('input[name=contextPath]').val();
    const url = contextPath + '/inquireDetail.me?boardNo=' + boardNo;
    open(url, '_blank', "width=800, height=700, scrollbars=yes, resizable=no, location=no"); 
}

function reserveDetail(){
    $('.reserve-info').each(function(){
        const reserveNo = $(this).find('input[name=reserveNo]').val();
        const url = 'reserveDetail.me?reserveNo=' + reserveNo;

        $(this).on('click', function(){
            open(url, '_blank', "width=600, height=600, scrollbars=yes, resizable=no, location=no"); 

        });
    });
}