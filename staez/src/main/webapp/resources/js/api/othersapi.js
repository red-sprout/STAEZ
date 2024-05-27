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

function selectPopularConcertImg(data, callback){
    $.ajax({
        url : "ajaxSelectCategoryConcertImg.ot",
        data : data,
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    }) 
}

function selectLatestConcert(data, callback){
    $.ajax({
        url : "ajaxSelectLatestCategoryConcert.ot",
        data : data,
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    })
}

function selectlatestConcertImg(data, callback){
    $.ajax({
        url : "ajaxSelectLatestCategoryConcertImg.ot",
        data : data,
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    }) 
}

function dateCategoryConcert(data, callback){
    $.ajax({
        url : "ajaxSelectDateCategoryConcert.ot",
        data : data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error : function(){
            console.log("실패")
        }
    })
}

function clickDateConcert(data, callback){
    $.ajax({
        url : "ajaxSelectDateCategoryConcert.ot",
        data : data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error : function(){
            console.log("실패")
        }
    })
}

function clickCategoryConcert(data, callback){
    $.ajax({
        url : "ajaxSelectDateCategoryConcert.ot",
        data : data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error : function(){
            console.log("실패")
        }
    })
}