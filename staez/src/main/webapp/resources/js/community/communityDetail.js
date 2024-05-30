window.onload = function(){
    communityCategory({ refCategoryNo: refCategoryMap.community, categoryLevel: 1 }, (res) => {
        setNav(res);
    });
}

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