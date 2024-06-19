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
        type: 'POST',
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
        type: 'POST',
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}



// 인기순위 - 찜기준
function popular(data, callback){
    $.ajax({
        url: contextPath + "popular.co",
        data: data,
        type :'POST',
        success : function(list){
            console.log(list);
            callback(list);
        }, error(){
            console.log("실패");
        }
    });
}

// 최신공연
function latest(data, callback){
    $.ajax({
        url: contextPath + "latest.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

// 별점높은
function highscore(data, callback){
    $.ajax({
        url: contextPath + "highscore.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}

// 지역전체
function locationAll(data, callback){
    $.ajax({
        url: contextPath + "locationAll.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}



//--------------------------------------- 공연 api
function conApi(callback){
    $.ajax({
        url: contextPath + "conapi.co",
        success : function(result) { // db에서 받아온 conList
            console.log(result);
            callback(result);
        }, error() {
            console.log("실패");
        }
    });
  }

  
  // 카테고리별 콘서트 내용 그려주는: 슬라이더랑, 그리드
function ajaxCategoryListAPI(callback){
    $.ajax({
        url: contextPath + "mainconapi.co",
        success : function(list){
            console.log(list);
            callback(list);
        }, error(){
            console.log("실패");
        }
    });
}

  // 카테고리별 콘서트 내용 그려주는: 슬라이더랑, 그리드
  function detailapi(callback){
    $.ajax({
        url: contextPath + "detailapi.co",
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
function likeUpdateApi(data, callback){
    $.ajax({
        url: contextPath + "likeupdateApi.co",
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
function likeCountApi(data, callback){
    $.ajax({
        url: contextPath + "likecountApi.co",
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


// 공연 세부 카테고리별 공연 그려주기
function conDetailapi(data, callback){
    $.ajax({
        url: contextPath + "conDetailapi.co",
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
function conSellDetailapi(data, callback){
    $.ajax({
        url: contextPath + "conSellDetailapi.co",
        data: data,
        success : function(result){
            console.log(result);
            callback(result);
        }, error(){
            console.log("실패");
        }
    });
}


// //리뷰 노필요 reviewDetail 다시쓰기 가능! DB 저장되어 있으니까
// function reviewDetailapi(data, callback){
//     $.ajax({
//         url: contextPath + "reviewDetailapi.co",
//         type: 'POST',
//         data: data,
//         success : function(result){
//             console.log(result);
//             callback(result);
//         }, error(){
//             console.log("실패");
//         }
//     });
// }
