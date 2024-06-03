//콘서트 navi 그려주는: 뮤지컬, 연극, 서커스...
function conNaviDraw(callback){
    $.ajax({
        url: contextPath + "connavi.co",
        success : function(conList) { // db에서 받아온 conList
            console.log(conList);
            callback(conList);
        }, error() {
            console.log("실패");
        }
    });
}

// 카테고리별 콘서트 내용 그려주는: 슬라이더랑, 그리드
function ajaxCategoryList(data, callback){
    console.log(data)
    $.ajax({
        url: contextPath + "maincon.co",
        data: data,
        success : function(list){
            console.log(list);
            callback(list);
        }, error(){
            console.log("실패");
        }
    });
}

// 좋아요 버튼
function likeUpdate(data, callback){
    $.ajax({
        url: contextPath + "likeupdate.co",
        data: data,
        type :'POST',
        success : function(result){
            console.log("insertLike:" + result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

// 좋아요 count
function likeCount(data, callback){
    $.ajax({
        url: contextPath + "likecount.co",
        data: data,
        type :'POST',
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

// 카테고리별 공연 그려주기
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

//리뷰
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

