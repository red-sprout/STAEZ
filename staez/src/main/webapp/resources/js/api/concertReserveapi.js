function ajaxConcertInfo(data, callback){
    $.ajax({
        url : "reserveConcertInfo.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}