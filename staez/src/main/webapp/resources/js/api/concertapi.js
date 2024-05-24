function conMainSlider(callback){
    $.ajax({
        url: contextPath + "mainSlider.co",
        success : function(res) {
            callback(res);
        }, error() {
            console.log("실패");
        }
    });
}

function conMainSliderPic(callback){
    $.ajax({
        url: contextPath + "mainSliderPic.co",
        success : function(res) {
            callback(res);
        }, error() {
            console.log("슬라이더 사진 실패");
        }
    });
}

