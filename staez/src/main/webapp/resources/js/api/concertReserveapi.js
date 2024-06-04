function ajaxConcertPeriod(data, callback){
    $.ajax({
        url : "ajaxConcertPeriod.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}