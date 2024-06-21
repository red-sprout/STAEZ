$(function(){
    insertAlphabet();
});

function insertAlphabet() {    
    const seatNo = $('.seat-no');

    const row = $('input[name=row]').val();
    const col = $('input[name=col]').val();
    const seat = $('input[name=seat]').val();
    console.log('row : ' + row);
    console.log('col : ' + col);

    const alphabet = convertToAlphabet(parseInt(row), col); // 수정: row, col을 정수로 변환하여 함수에 전달
    seatNo.text(`좌석 : ${seat}석 ${alphabet}`);
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