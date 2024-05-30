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

// // 좋아요 버튼
// function conHeart(data, callback){
//     $.ajax({
//         url: contextPath + "conheart.co",
//         data: data,
//         type :'POST',
//         success : function(conL){
//             console.log(conL);
//             callback(conL);
//         }, error(){
//             console.log("실패");
//         }
//     });
// }

// 공연 상세정보
function conDetail(data, callback){
    $.ajax({
        url: contextPath + "conDetail.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

// 판매정보
function conSellDetail(data, callback){
    $.ajax({
        url: contextPath + "conSellDetail.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

// 한줄평
function commentDetail(data, callback){
    $.ajax({
        url: contextPath + "commentDetail.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

function reviewDetail(data, callback){
    $.ajax({
        url: contextPath + "reviewDetail.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}
