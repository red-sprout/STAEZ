$(function(){
    const data = getUrlParams()
    const userNo = $("input[name=userNo]").val();
    const writerNo = $("input[name=writerNo]").val();
    data.userNo = userNo;

    selectProfile({"userNo" : writerNo}, (profile) => {
        const profileImg = document.getElementById("notice-profile-img");
        profileImg.setAttribute("src", contextPath + profile);
    })

    selectLike(data, (res) => {
        likeStatus(res);
    });

    const dateTd = document.getElementById("detail-write-date");
    const boardWriteDate = document.querySelector("input[name=boardWriteDate]");
    dateTd.innerText = timeFormatForSeconds(boardWriteDate.value);
});

function imgsrc(str) {
    return `/staez/resources/img/community/communityDetail/${str}.png`;
}

function likeStatus(result) {
    const img = document.querySelector(".community-circle-area img");
    const h4 = document.querySelector(".community-circle-area h4");
    const likeYes = "like-yes";
    const likeNo = "like-no";

    img.setAttribute("src", imgsrc(result.userBoardLike ? likeYes : likeNo));
    h4.innerHTML = result.boardLikeCnt;
}

function likeToggle(_this) {
    const likeYes = "like-yes";
    const likeNo = "like-no";
    const img = _this.children[0];
    const h4 = _this.children[1];

    const data = {
        "boardNo": document.querySelector("input[name=boardNo]").value,
        "userNo": document.querySelector("input[name=userNo]").value
    };

    if(img.getAttribute("src").includes(likeYes)) {
        // ajax 요청 보내기
        data.status = "N";
        onClickLike(data, (res) => h4.innerHTML = res);
        img.setAttribute("src", imgsrc(likeNo));
    } else {
        // ajax 요청 보내기
        data.status = "Y";
        onClickLike(data, (res) => h4.innerHTML = res);
        img.setAttribute("src", imgsrc(likeYes));
    }
}