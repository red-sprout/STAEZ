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

    selectReplyAll(data, (res) => {
        initReply();
        setReply(res, undefined, 0);
    });

    const concertNo = document.querySelector("input[name='tag']").value;
    const dateTd = document.getElementById("detail-write-date");
    const boardWriteDate = document.querySelector("input[name=boardWriteDate]");

    if(concertNo) {
        setTag(concertNo);
    }

    dateTd.innerText = timeFormatForSeconds(boardWriteDate.value);
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

function replyLikeStatus(result, replyNo) {
    const replyItems = document.querySelectorAll(".reply-flex");
    replyItems.forEach(item => {
        const hiddenValue = parseInt(item.querySelector("input[type='hidden']").value);
        if (hiddenValue === replyNo) {
            drawReplyLike(result, item);
        }
    });
}

function drawReplyLike(result, item) {
    const img = item.querySelector(".reply-like img");
    const h4 = item.querySelector(".reply-like h4");

    const likeYes = "like-yes";
    const likeNo = "like-no";

    img.setAttribute("src", imgsrc(result.userReplyLike ? likeYes : likeNo));
    h4.innerHTML = result.ReplyLikeCnt;
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

function replyLikeToggle(_this, replyNo) {
    const likeYes = "like-yes";
    const likeNo = "like-no";
    const img = _this.children[0];
    const h4 = _this.children[1];

    const data = {
        replyNo,
        userNo: document.querySelector("input[name=userNo]").value
    };

    if(img.getAttribute("src").includes(likeYes)) {
        // ajax 요청 보내기
        data.status = "N";
        onClickReplyLike(data, (res) => h4.innerHTML = res);
        img.setAttribute("src", imgsrc(likeNo));
    } else {
        // ajax 요청 보내기
        data.status = "Y";
        onClickReplyLike(data, (res) => h4.innerHTML = res);
        img.setAttribute("src", imgsrc(likeYes));
    }
}

function replyFocus() {
    $("#reply-input").focus();
}

function initReply() {
    const communityContents = document.getElementById("community-contents");
    const replyFlex = [...document.getElementsByClassName("reply-flex")];
    document.getElementById("reply-input").value = "";
    replyFlex.forEach((ele) => communityContents.removeChild(ele));
}

function setReply(result, refNo, level) {
    const communityContents = document.getElementById("community-contents");
    for(let ele of result) {
        if(ele.refReplyNo != refNo) {
            continue;
        }
        const replyFlex = document.createElement("li");
        const communityReply = document.createElement("div");
        const replyNo = document.createElement("input");

        replyFlex.setAttribute("class", "reply-flex");
        communityReply.setAttribute("class", "community-reply");
        
        replyNo.type = "hidden"
        replyNo.value = ele.replyNo;

        communityReply.appendChild(replyNo);
        communityReply.appendChild(replyMenu(ele));
        communityReply.appendChild(replyWrapper(ele));

        for(let i = 0; i < Math.min(level, 5); i++) {
            replyFlex.appendChild(blank());
        }
        replyFlex.appendChild(communityReply);
        communityContents.appendChild(replyFlex);

        setReply(result, ele.replyNo, level + 1);

        selectReplyLike({
            replyNo: ele.replyNo, userNo: $("input[name=userNo]").val()
        }, (result) => {
           replyLikeStatus(result, ele.replyNo);
        });
    }
    addEvent();
}

function blank() {
    const div = document.createElement("div");
    div.setAttribute("class", "reply-level");
    return div;
}

function replyMenu(result) {
    const div = document.createElement("div");
    const action = ["수정", "삭제", "답글"];
    div.setAttribute("class", "reply-menu");
    if(!checkUser(result.userNo)) {
        const btn = document.createElement("button");
        btn.setAttribute("class", "function");
        btn.innerHTML = "답글";
        div.appendChild(btn);

        return div;
    }

    for(let i = 0; i < 3; i++) {
        const btn = document.createElement("button");
        const img = document.createElement("img");

        btn.setAttribute("class", "function");
        img.setAttribute("src", contextPath + "/resources/img/common/header/divide.png");

        btn.innerHTML = action[i];

        if(i !== 0) {
            div.appendChild(img);
        }
        div.appendChild(btn);
    }

    return div;
}

function replyWrapper(result) {
    const div = document.createElement("div");
    const profile = document.createElement("div");
    const contents = document.createElement("div");

    div.setAttribute("class", "reply-wrapper");
    profile.setAttribute("class", "reply-profile-area");
    contents.setAttribute("class", "reply-contents");

    profile.innerHTML += `<img src="${contextPath + result.path}">`;

    const replyText = document.createElement("div");
    const replyLike = document.createElement("div");

    replyText.setAttribute("class", "reply-text");
    replyLike.setAttribute("class", "reply-like");

    replyText.innerHTML += `<h3>${result.nickname}</h3>`
    replyText.innerHTML += `<p>${result.replyContent}</p>`

    const replyLikeStatus = document.createElement("img");
    const replyLikeCnt = document.createElement("h4");
    replyLikeStatus.setAttribute("src", contextPath + "/resources/img/community/communityDetail/like-no.png");
    replyLikeCnt.innerHTML = 0;

    replyLike.addEventListener("click", (ev) =>{
        const parent = ev.currentTarget.parentNode.parentNode.parentNode;
        replyLikeToggle(ev.currentTarget, parent.querySelector("input[type=hidden]").value);
    });

    replyLike.appendChild(replyLikeStatus);
    replyLike.appendChild(replyLikeCnt);

    contents.appendChild(replyText);
    contents.appendChild(replyLike);

    div.appendChild(profile);
    div.appendChild(contents);
    return div;
}

function addEvent() {
    const replyMenu = document.querySelectorAll(".reply-menu .function");
    for(let ele of replyMenu) {
        switch(ele.innerText) {
            case "수정":
                ele.addEventListener("click", (ev) => updateReplyAddEvent(ev.currentTarget.parentNode.parentNode));
                break;
            case "삭제":
                ele.addEventListener("click", (ev) => deleteReplyEvent(getReplyNo(ev)));
                break;
            default:
                ele.addEventListener("click", (ev) => addReplyEvent(ev.currentTarget.parentNode.parentNode.parentNode));
                break;
        }
    }
}

function getReplyNo(ev) {
    return ev.currentTarget.parentNode.parentNode.children[0].value;
}

function checkUser(userNo) {
    const loginUser = parseInt(document.querySelector("input[name=userNo]").value);
    return userNo === loginUser;
}

function addReplyEvent(target) {
    const existingReplyFlex = document.querySelector(".reply-flex.reply-input");
    if (existingReplyFlex) {
        existingReplyFlex.remove();
    }

    const replyFlex = document.createElement("li");
    const communityReply = document.createElement("div");
    const textarea = document.createElement("textarea");
    const replyNo = document.createElement("input");

    const div = document.createElement("div");
    div.setAttribute("class", "reply-menu");
    const btn = document.createElement("button");
    btn.setAttribute("class", "function");
    btn.innerHTML = "작성";
    div.appendChild(btn);

    replyFlex.setAttribute("class", "reply-flex reply-input");
    communityReply.setAttribute("class", "community-reply");
    
    replyNo.type = "hidden";
    replyNo.value = document.querySelector("input[name=userNo]").value;

    communityReply.appendChild(replyNo);
    communityReply.appendChild(div);
    communityReply.appendChild(textarea);
    replyFlex.appendChild(blank());
    replyFlex.appendChild(blank());
    replyFlex.appendChild(communityReply);
    target.after(replyFlex);

    styledTextArea(textarea);
    communityReply.style.border = "1px solid #969696";
    communityReply.style.borderRadius = "5px";

    btn.addEventListener("click", (ev) => {
        const refReplyNo = target.querySelector("input[type=hidden]").value;
        const replyContent = textarea.value;
        insertReplyEvent(refReplyNo, replyContent);
    });
}

function insertReplyEv(refReplyNo) {
    const boardNo = document.querySelector("input[name=boardNo").value;
    const userNo = document.querySelector("input[name=userNo]").value;
    const replyContent = document.getElementById("reply-input").value;
    insertReply({
        refReplyNo, boardNo, userNo, replyContent
    }, (result) => {
        replyStatus(result.length);
        initReply();
        setReply(result, undefined, 0);
    });
}

function insertReplyEvent(refReplyNo, replyContent) {
    const boardNo = document.querySelector("input[name=boardNo").value;
    const userNo = document.querySelector("input[name=userNo]").value;
    insertReply({
        refReplyNo, boardNo, userNo, replyContent
    }, (result) => {
        replyStatus(result.length);
        initReply();
        setReply(result, undefined, 0);
    });
}

function updateReplyAddEvent(parent) {
    const target = parent.children[2];
    const textarea = document.createElement("textarea");
    target.children[1].innerHTML = ``;
    target.children[1].appendChild(textarea);
    styledTextArea(textarea);
    parent.querySelector(".reply-menu .function").addEventListener("click", (ev) => {
        const replyContent = textarea.value;
        const replyNo = parent.children[0].value;
        updateReplyEvent(replyContent, replyNo);
    })
}

function updateReplyEvent(replyContent, replyNo) {
    const boardNo = document.querySelector("input[name=boardNo").value;
    updateReply({
        boardNo, replyContent, replyNo
    }, (result) => {
        replyStatus(result.length);
        initReply();
        setReply(result, undefined, 0);
    });
}

function styledTextArea(textarea) {
    textarea.style.width = "600px";
    textarea.style.height = "100px";
    textarea.style.resize = "none";
    textarea.style.border = "none";
    textarea.style.padding = "10px";
    textarea.style.outline = "none";
    textarea.style.margin = "0 10px 0 10px";
}

function deleteReplyEvent(replyNo) {
    const boardNo = document.querySelector("input[name=boardNo]").value;
    deleteReply({
        boardNo, replyNo
    }, (result) => {
        replyStatus(result.length);
        initReply();
        setReply(result, undefined, 0);
    });
}