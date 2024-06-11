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

function ajaxConcertDayOff(data, callback){
    $.ajax({
        url : "ajaxConcertDayOff.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function ajaxChoiceDateSchedule(data, callback){
    $.ajax({
        url : "ajaxChoiceDateSchedule.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function ajaxChoiceScheduleSeat(data, callback){
    $.ajax({
        url : "ajaxChoiceScheduleSeat.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}

function ajaxTheaterSeatInfo(data, callback){
    $.ajax({
        url : "ajaxTheaterSeatInfo.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}

function ajaxImpossibleSeatInfo(data, callback){
    $.ajax({
        url : "ajaxImpossibleSeatInfo.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}

function ajaxReserveSeatInfo(data, callback){
    $.ajax({
        url : "ajaxReserveSeatInfo.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}

function ajaxGradeSeatInfo(data, callback){
    $.ajax({
        url : "ajaxGradeSeatInfo.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}
 
function ajaxinsertReserve(data, callback){
    $.ajax({
        type: "POST",
        url : "insertReserve.co",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}   

function ajaxKakaoPay(callback){
    $.ajax({
        type: "POST",
        url : "kakaopay.co",
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    }) 
}