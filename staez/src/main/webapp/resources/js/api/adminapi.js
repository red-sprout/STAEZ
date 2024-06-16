function category(data, callback){
    $.ajax({
        url: contextPath + "category.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}

function ajaxToggleSeat(data, callback) {
    $.ajax({
        url: contextPath + "toggleSeat.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("toggleSeat 요청 실패");
        }
    });
}

function summernote() {
    $('#summernote').summernote({
        placeholder: '원하는 내용을 입력하세요',
        lang: 'ko-KR',
        tabsize: 2,
        height: 500,
        callbacks: {
            onImageUpload: fileUpload
        }
    });
}

function ajaxConcertSchedule(data, callback) {
    $.ajax({
        url: contextPath + "concertScheduleIncert.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("스케줄 요청 실패");
        }
    });
}

function ajaxSearchTheaterList(data, callback) {
    $.ajax({
        url: contextPath + "searchTheaterList.ad",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("공연 검색 실패");
        }
    });
}

function insertFileApi(data, callback) {
    $.ajax({
        url: contextPath + "concertImgUpload.ad",
        type: "POST",
        data: data,
        processData: false, // 기본이 true로 true일 때는 전송하는 data를 string으로 변환해서 요청
        contentType: false, // application/x-www-form-urlencoded; charset=UTF-8; -> multipart/form-data로 보내기위해 false로 지정
        dataType: "json", // 서버로부터 json으로 데이터를 받겠다.
        success: function (changeNameList) {
            callback(changeNameList);
        },
        error: function () {
            console.log("파일업로드 api요청 실패")
        }
    })
}

function consertInsert(data, callback) {
    $.ajax({
        url: contextPath + "concertInsert.ad",
        type: "POST",
        processData: false,
        contentType: false,
        data: data,
        success: function(res) {
            callback(res);
        }, 
        error: function () {
            console.log("삽입 실패");
        }
    })
}

function insertNotice(data, callback) {
    $.ajax({
        url: contextPath + "insert.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("게시글 등록 실패");
        }
    });
}

function selectNotice(data, callback) {
    $.ajax({
        url: contextPath + "main.no",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("게시글 조회 실패");
        }
    })
}

function insertNotice(data, callback) {
    $.ajax({
        url: contextPath + "insert.no",
        type: "POST",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("게시글 등록 실패");
        }
    });
}

//공연리스트 관련
function ajaxConcertContentList(data, callback){
    $.ajax({
        url: contextPath + "ajaxConcertContentList.ad",
        data: data,
        success : function(result) {
            callback(result);
        }, error() {
            console.log("공연 정보 실패");
        }
    }); 
}

function ajaxConcertImgList(data, callback){
    $.ajax({
        url: contextPath + "ajaxConcertImgList.ad",
        data: data,
        success : function(result) {
            callback(result);
        }, error() {
            console.log("공연 이미지 실패");
        }
    }); 
}

function deleteConcert(data, callback) {
    $.ajax({
        url: contextPath + "delete.co",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            alert("삭제할 수 없는 공연입니다.");
        }
    });
}

function consertUpdate(data, callback) {
    $.ajax({
        url: contextPath + "concertUpdate.ad",
        type: "POST",
        processData: false,
        contentType: false,
        data: data,
        success: function (res) {
            callback(res);
        },
        error: function () {
            console.log("삽입 실패");
        }
    })
}

//공연장리스트 관련
function ajaxTheaterList(data, callback){
    $.ajax({
        url: contextPath + "ajaxTheaterList.ad",
        data: data,
        success : function(result) {
            callback(result);
        }, error() {
            console.log("공연장 정보 실패");
        }
    }); 
}

function deleteTheater(data, callback) {
    $.ajax({
        url: contextPath + "delete.th",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            alert("삭제할 수 없는 공연장입니다.");
        }
    });
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

function selectLike(data, callback) {
    $.ajax({
        url: contextPath + "select.bl",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("좋아요 요청 실패");
        }
    })
}

// 좋아요 클릭시 상태 변경 api
function onClickLike(data, callback) {
    $.ajax({
        url: contextPath + "update.bl",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("좋아요 요청 실패");
        }
    });
}

// 공지사항 조회 api
function noticeMainList(data, callback) {
    $.ajax({
        url: contextPath + "list.no",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("공지사항 요청 실패")
        }
    });
}

// 카테고리 가져오기
// 커뮤니티 양식과 동일
function noticeCategory(data, callback) {
    $.ajax({
        url: contextPath + "category.ct",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}

// 카테고리 정보 불러오기(이름)
// data : boardNo
function noticeBoardCategory(data, callback) {
    $.ajax({
        url: contextPath + "notice.ct",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}

// 관리자의 유저 정보 조회
// data - select : 검색 항목, keyword : 검색 키워드, currentPage : 현재 페이지
function adminSelectUser(data, callback) {
    $.ajax({
        url: contextPath + "adminSelect.me",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("이용자 조회 실패");
        }
    });
}

// 유저 강퇴 api
// data - userList : 체크한 userNo
function deleteUser(data, callback) {
    $.ajax({
        url: contextPath + "adminDelete.me",
        type: "POST",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("강퇴 api 요청 실패");
        }
    });
}

// 유저 권한 수정
// data - userList, grade
function updateGradeUser(data, callback) {
    $.ajax({
        url: contextPath + "adminUpdateGrade.me",
        type: "POST",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("권한 수정 api 요청 실패");
        }
    });
}

// 관리자의 커뮤니티 정보 조회
// data - select : 검색 항목, keyword : 검색 키워드, currentPage : 현재 페이지
function adminSelectCommunity(data, callback) {
    $.ajax({
        url: contextPath + "adminSelect.cm",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("커뮤니티 조회 실패");
        }
    });
}

// 커뮤니티 카테고리 정보 조회
// data - refCategoryNo, categoryLevel
function communityCategory(data, callback) {
    $.ajax({
        url: contextPath + "category.ct",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}

// 커뮤니티 게시글 삭제 api
// data - boardList
function deleteCommunity(data, callback) {
    $.ajax({
        url: contextPath + "adminDelete.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("강퇴 api 요청 실패");
        }
    });
}

// 커뮤니티 카테고리 업데이트 api
// data - boardList, categoryNo
function updateCategoryCommunity(data, callback) {
    $.ajax({
        url: contextPath + "adminUpdateCategory.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("커뮤니티 삭제 api 요청 실패");
        }
    });
}

// 관리자의 Faq 정보 조회
// data - select : 검색 항목, keyword : 검색 키워드, currentPage : 현재 페이지
function adminSelectFaq(data, callback) {
    $.ajax({
        url: contextPath + "adminSelect.fq",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Faq 조회 실패");
        }
    });
}

// Faq 삭제 api
// data - boardList
function deleteFaq(data, callback) {
    $.ajax({
        url: contextPath + "adminDelete.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Faq 삭제 api 요청 실패");
        }
    });
}

// 게시글을 번호로 조회시 사용
// data - boardNo
function selectOneBoard(data, callback) {
    $.ajax({
        url: contextPath + "select.bo",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("board 한 개 api 요청 실패");
        }
    });
}

function adminSelectInquire(data, callback) {
    $.ajax({
        url: contextPath + "adminSelect.iq",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Inquire 조회 실패");
        }
    });
}

function deleteInquire(data, callback) {
    $.ajax({
        url: contextPath + "adminDelete.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Inquire 삭제 api 요청 실패");
        }
    });
}

function adminSelectReport(data, callback) {
    $.ajax({
        url: contextPath + "adminSelect.rp",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Report 조회 실패");
        }
    });
}

function deleteReport(data, callback) {
    $.ajax({
        url: contextPath + "adminDelete.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Report 삭제 api 요청 실패");
        }
    });
}

function adminSelectReserve(data, callback) {
    $.ajax({
        url: contextPath + "adminSelect.re",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Reserve 조회 실패");
        }
    });
}

function updateReserve(data, callback) {
    $.ajax({
        url: contextPath + "adminUpdate.re",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("Reserve 상태 수정 api 요청 실패");
        }
    });
}

function updateNotice(data, callback) {
    $.ajax({
        url: contextPath + "update.cm",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("공지사항 update api 요청 실패");
        }
    });
}

function selectSeat(data, callback) {
    $.ajax({
        url: contextPath + "selectSeat.ad",
        data: data,
        success: function (res) {
            callback(res);
        }, error() {
            console.log("좌석 api 요청 실패");
        }
    });
}