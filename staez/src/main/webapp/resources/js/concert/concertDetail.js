function likeToggle(_this) {
    // const check = _this.children[1];
    // check.checked = !check.checked;
    // fa-solid && fa-regular
    _this.children[0].classList.toggle("fa-solid");
    _this.children[0].classList.toggle("fa-regular");
}

function reservePage(){
    window.open('/staez/selectDate.co' , "_blank", "width=1001, height=601, scrollbars=no");
}

function test() {
    $.ajax({
        url: "http://localhost:8888/staez/sellInfo.co",
        type: "GET" // 또는 POST 등 적절한 HTTP 메서드 선택
        // 필요한 경우 요청 데이터도 포함하여 전달
        // data: { key1: value1, key2: value2, ... }
        ,
        data: 1,
        success: function(){
            console.log("성공")
        },
        error : function(){
            console.log("실패")
        }
    });
}

