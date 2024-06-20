//메인페이지 api
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



function mainPopularBoardList(callback){
    $.ajax({
        url : "ajaxSelectPopularBoardList.ot",
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    }) 
}

function selectUserLikeBoardNo(data, callback){
    $.ajax({
        url : "ajaxSelectUserLikeBoardNo.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패");
        }
    }) 
}

function popularBoardCategory(callback){
    $.ajax({
        url : "ajaxSelectpopularBoardCategory.ot",
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    }) 
}

function popularBoardUserProfile(callback){
    $.ajax({
        url : "ajaxSelectpopularBoardUserProfile.ot",
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패");
        }
    }) 
}

function selectProfile(data, callback) {
    $.ajax({
        url: contextPath + "select.pr",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("프로필 요청 실패");
        }
    })
}




//캘린더 ajax

function dateCategoryConcert(data, callback){
    $.ajax({
        url : "ajaxSelectDateCategoryConcert.ot",
        data : data,
        success : function(result){
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
            callback(result);
        }, error : function(){
            console.log("실패")
        }
    })
}

function pageConcert(data, callback){
    $.ajax({
        url : "ajaxSelectDateCategoryConcert.ot",
        data : data,
        success : function(result){
            callback(result);
        }, error : function(){
            console.log("실패")
        }
    })
}


function reserveConcertList(data, callback){
    $.ajax({
        url : "ajaxReserveConcertList.ot",
        data : data,
        success : function(result){
            console.log(result)
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function reserveChoiceConcertList(data, callback){
    $.ajax({
        url : "ajaxChoiceReserveConcertList.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function insertUpdatelike(data, callback){
    $.ajax({
        url : "ajaxInsertUpdatelike.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function updateNolike(data, callback){
    $.ajax({
        url : "ajaxUpdateNoLike.ot",
        data : data,
        success : function(result){
            console.log("취소")
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

// 검색 결과 ajax

function keywordConcertList(data, callback){
    $.ajax({
        url : "ajaxKeywordConcertList.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordConcertImgList(data, callback){
    $.ajax({
        url : "ajaxKeywordConcertImgList.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordBoardList(data, callback){
    $.ajax({
        url : "ajaxKeywordBoardList.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordCategoryList(data, callback){
    $.ajax({
        url : "ajaxKeywordCategoryList.ot",
        data : data,
        success : function(result){
            console.log(result)
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordUserProfile(data, callback){
    $.ajax({
        url : "ajaxKeywordUserProfile.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

// 검색 결과 콘서트 더보기ajax

function keywordMoreEndConcert(data, callback){
    $.ajax({
        url : "ajaxKeywordMoreEndConcert.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordMoreEndConcertImg(data, callback){
    $.ajax({
        url : "ajaxKeywordMoreEndConcertImg.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordMoreConcert(data, callback){
    $.ajax({
        url : "ajaxKeywordMoreConcert.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

function keywordMoreConcertImg(data, callback){
    $.ajax({
        url : "ajaxKeywordMoreConcertImg.ot",
        data : data,
        success : function(result){
            callback(result)
        }, error : function(){
            console.log("실패")
        }
    })
}

//concetApi정보 가져오기
function ajaxApiConcertInfo(data) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "ajaxApiConcertInfo.ot",
            data: data,
            dataType: "json",
            success: function(result) {
                resolve(result); // 성공 시 받은 데이터를 resolve
            },
            error: function(error) {
                reject(error); // 실패 시 오류를 reject
            }
        });
    });
}