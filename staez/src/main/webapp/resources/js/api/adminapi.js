function faq(data, callback){
    $.ajax({
        url: contextPath + "faqCategory.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("faq 요청 실패");
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