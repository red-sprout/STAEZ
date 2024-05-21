function likeToggle(_this) {
    const likeYes = "like-yes";
    const likeNo = "like-no";
    const img = _this.children[0];

    const imgsrc = (str) => (`/staez/resources/img/community/communityDetail/${str}.png`);
    if(img.getAttribute("src").includes(likeYes)) {
        // ajax 요청 보내기
        img.setAttribute("src", imgsrc(likeNo));
    } else {
        // ajax 요청 보내기
        img.setAttribute("src", imgsrc(likeYes));
    }
}

function commentFocus() {
    $("#reply-input").focus();
}