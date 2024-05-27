function conNaviDraw(callback){
    $.ajax({
        url: contextPath + "connavi.co",
        success : function(conList) {
            callback(conList);
        }, error() {
            console.log("실패");
        }
    });
}

function conMainDraw(callback){
    $.ajax({
        url: contextPath + "maincon.co",
        success : function(list) {
            console.log(list);
            callback(list);
        }, error() {
            console.log("실패");
        }
    });
}


