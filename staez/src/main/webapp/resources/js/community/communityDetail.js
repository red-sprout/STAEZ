$(function(){
    const data = getUrlParams()
    const userNo = $("input[name=userNo]").val();
    const writerNo = $("input[name=writerNo]").val();
    data.userNo = userNo;

    communityCategory({ refCategoryNo: refCategoryMap.community, categoryLevel: 1 }, (res) => {
        setNav(res);
    });

    selectProfile({ userNo: writerNo }, (res) => {
        profileStatus(res, ".profile-area #profile-img");
    });

    selectProfile({ userNo: userNo }, (res) => {
        profileStatus(res, "#reply-input-area img");
    });

    selectLike(data, (res) => {
        likeStatus(res);
    });

    selectReply(data, (res) => {
        replyStatus(res);
    });

    boardCategory(data, (res) => {
        setCategory(res);
    })

    selectReply(data, (res) => {
        console.log(res);
    });

    const concertNo = document.querySelector("input[name='tag']").value;
    if(concertNo) {
        setTag(concertNo);
    }
});

function imgsrc(str) {
    return `/staez/resources/img/community/communityDetail/${str}.png`;
}

function setNav(result) {
    const ul = document.getElementById("community-nav");
    ul.innerHTML += `<li class="write-btn" onclick="location.href='main.cm'">
                        <h2>커뮤니티 메인</h2>
                    </li>`;

    for (let ele of result) {
        const li = document.createElement("li");
        const h2 = document.createElement("h2");
        const input = document.createElement("input");

        li.setAttribute("class", "community-nav-li");
        li.setAttribute("onclick", `location.href='main.cm?categoryNo=${ele.categoryNo}'`);

        h2.innerHTML += ele.categoryName;
        input.type = "hidden"
        input.value = ele.categoryNo;
        input.setAttribute("class", "community-hidden-input");

        li.appendChild(h2);
        li.appendChild(input)
        ul.appendChild(li);
    }

    ul.innerHTML += `<li id="write-btn" onclick="location.href='incertForm.cm'">
                        <h2>글쓰기</h2>
                        <img src="${contextPath}/resources/img/community/communityMain/write.png">
                    </li>`;
}

function profileStatus(result, path) {
    const profile = document.querySelector(path);
    profile.setAttribute("src", contextPath + result);
}

function likeStatus(result) {
    const img = document.querySelector(".community-circle-area:nth-child(1) img");
    const h4 = document.querySelector(".community-circle-area:nth-child(1) h4");
    const likeYes = "like-yes";
    const likeNo = "like-no";

    img.setAttribute("src", imgsrc(result.userBoardLike ? likeYes : likeNo));
    h4.innerHTML = result.boardLikeCnt;
}

function replyStatus(result) {
    const h4 = document.querySelectorAll(".reply-cnt");
    for(let ele of h4) {
        ele.innerHTML = result;
    }
}

function setCategory(result) {
    const categoryArea = document.getElementById("community-category");
    for(let ele of result) {
        const btn = document.createElement("button");
        const h4 = document.createElement("h4");

        btn.setAttribute("class", "btn-staez checked");
        h4.innerHTML = ele.categoryName;

        btn.appendChild(h4);
        categoryArea.appendChild(btn);
    }
}

function setTag(concertNo) {
    const boardContent = document.getElementById("board-content");
    const tagWrapper = styledTagWrapper();

    tagWrapper.innerHTML += `<a href='detail.co?concertNo=${concertNo}'>
                                해당 공연으로 바로 가기 >
                            </a>`;
    
    boardContent.appendChild(tagWrapper);
}

function styledTagWrapper() {
    const tagWrapper = document.createElement("div");

    tagWrapper.style.border = "1px solid #969696";
    tagWrapper.style.margin = "30px";
    tagWrapper.style.padding = "30px";
    tagWrapper.style.cursor = "pointer";

    tagWrapper.addEventListener("mouseenter", (ev) => (ev.target.style.background = "#d9d9d9"));
    tagWrapper.addEventListener("mouseleave", (ev) => (ev.target.style.background = "white"))
    tagWrapper.addEventListener("click", (ev) => (ev.currentTarget.children[0].click()));

    return tagWrapper;
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

function commentFocus() {
    $("#reply-input").focus();
}