function mainCategoryName(callback){
    $.ajax({
        url : "ajaxSelectCategory.ot",
        success : function(result){
            callback(result);
        },error : function(){
            console.log("실패")
        }
    })

}

function selectPopularConcert(data, callback){
    $.ajax({
        url : "ajaxSelectCategoryConcert.ot",
        data : data,
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    })
}