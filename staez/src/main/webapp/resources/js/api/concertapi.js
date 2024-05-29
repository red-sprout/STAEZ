//콘서트 navi 그려주는
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

//콘서트 내용 그려주는
function conMainDraw(callback){
    $.ajax({
        url: contextPath + "maincon.co",
        success : function(list){
            callback(list);
        }, error(){
            console.log("실패");
        }
    });
}

// 좋아요 버튼
function conHeart(data, callback){
    $.ajax({
        url: contextPath + "conheart.co",
        data: data,
        type :'POST',
        success : function(conL){
            console.log(conL);
            callback(conL);
        }, error(){
            console.log("실패");
        }
    });
}
