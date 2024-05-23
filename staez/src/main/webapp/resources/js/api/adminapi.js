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