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

function insertFileApi(data, callback) {
    $.ajax({
        url: contextPath + "communityImgUpload.cm",
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

function communityCategory(data, callback) {
    $.ajax({
        url: contextPath + "category.cm",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}

function searchConcertList(data, callback) {
    $.ajax({
        url: contextPath + "searchConcertList.cm",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("공연 요청 실패");
        }
    });
}

function insertBoard(data, callback) {
    $.ajax({
        url: contextPath + "insert.cm",
        type: "POST",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("게시글 등록 실패");
        }
    });
}

function selectBoard(data, callback) {
    $.ajax({
        url: contextPath + "main.cm",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("게시글 조회 실패");
        }
    })
}

function boardCategory(data, callback) {
    $.ajax({
        url: contextPath + "boardCategory.cm",
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log("카테고리 요청 실패");
        }
    });
}