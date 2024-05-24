function category(data, callback){
    $.ajax({
        url: contextPath + "category.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}

function ajaxToggleSeat(data, callback) {
    $.ajax({
        url: contextPath + "toggleSeat.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("toggleSeat 요청 실패");
        }
    });
}

function summernote() {
    $('#summernote').summernote({
        placeholder: '원하는 내용을 입력하세요',
        lang: 'ko-KR',
        tabsize: 2,
        height: 500
    });
}

function ajaxConcertSchedule() {
    $.ajax({
        url: contextPath + "concertScheduleIncert.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("스케줄 요청 실패");
        }
    });
}