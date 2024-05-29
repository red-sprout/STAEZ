//콘서트 navi 그려주는
function conNaviDraw(callback){
    $.ajax({
        url: contextPath + "connavi.co",
        success : function(conList) {
            console.log(conList);
            callback(conList);
        }, error() {
            console.log("실패");
        }
    });
}

//콘서트 내용 그려주는
function conMainDraw(callback){
    $.ajax({
        url: contextPath + "maincon.co",
        success : function(list){
            console.log(list);
            callback(list);
        }, error(){
            console.log("실패");
        }
    });
}

//콘서트 내용 그려주는
function conMainDraw(callback){
    $.ajax({
        url: contextPath + "maincon.co",
        success : function(list){
            console.log(list);
            callback(list);
        }, error(){
            console.log("실패");
        }
    });
}

function conHeart(data, callback){
    $.ajax({
        url: contextPath + "conheart.co",
        data: data,
        success : function(like){
            console.log(like);
            callback(like);
        }, error(){
            console.log("실패");
        }
    });
}
