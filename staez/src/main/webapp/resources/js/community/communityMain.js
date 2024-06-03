$(function() {
    communityCategory({refCategoryNo: 2, categoryLevel: 1}, (res) => {
        setNav(res);
        setColor();
    });
    
    communityCategory({refCategoryNo: 2, categoryLevel: 2}, (res) => {
        setCategory(res, 'community-category');
    });

    communityMainList({
        categoryNo: getCommunityCategoryNo(),
        cPage: 1
    }, (res) => {
        drawBoard(result);
    })

})

function getCommunityCategoryNo() {

}

// 요소 그리기
function drawBoard(result) {
    const communityContents = document.getElementById("community-contents");
    for(let b of result) {
        const li = communityPosting(b.boardNo);
        const table = table(b);
        li.appendChild(table)
        communityContents.appendChild(li);
    }
    initBoardList();
}

// li 태그 그리기 - 게시글 한 요소
function communityPosting(boardNo) {
    const li = document.createElement("li");
    li.setAttribute("class", "community-posting");
    li.addEventListener("click", (ev) => {
        location.href = `detail.cm?boardNo=${boardNo}`;
    });
    return li;
}

// table 태그 그리기 - 게시글 한 요소 내용
function table(board) {
    const table = document.createElement("table");
    const tbody = tableRows(board);
    table.appendChild(tbody);
    return table;
}

// tr 태그 그리기 - 게시글 한 요소 상세 내용
function tableRows(board) {
    const result = document.createElement("tbody");

    const profileArea = profileArea(board);
    profileArea.setAttribute("class", "profile-area");
    result.appendChild(profileArea);

    const writeDate = document.createElement("tr");
    writeDate.innerHTML += `<td>${board.boardWriteDate}</td>`;
    result.appendChild(writeDate);

    const boardTitle = document.createElement("tr");
    boardTitle.innerHTML += `<td colspan="2"><h3>${board.boardTitle}</h3></td>`;
    result.appendChild(boardTitle);

    const boardContent = document.createElement("tr");
    boardContent.innerHTML += `<td colspan="2" class="boardContent">${board.boardContent}</td>`;
    result.appendChild(boardContent);

    const postingCategory = document.createElement("tr");
    postingCategory.innerHTML += `<td colspan="2"></td>`;
    postingCategory.setAttribute("class", "posting-category");
    result.appendChild(postingCategory);

    return result;
}

function profileArea(board) {
    const tRow = document.createElement("tr");

    const profileImg = document.createElement("td");
    profileImg.setAttribute("rowspan", 2);
    profileImg.setAttribute("width", "60px");
    profileImg.innerHTML += `<img src="/resources/uploadfiles/profile/no-data.png" alt=""></img>`;
    tRow.appendChild(profileImg);

    const nickname = document.createElement("td");
    nickname.innerHTML += `<h4>${board.nickname}</h4>`;

    const hidden = document.createElement("td");
    hidden.setAttribute("rowspan", 5);
    hidden.innerHTML += `
        <input type="hidden" name="boardNo" value="${board.boardNo}" class="boardNo">
        <input type="hidden" name="userNo" value="${board.userNo}" class="userNo">
    `;

    return tRow;
}

function initBoardList() {
    const btnArea = [...document.querySelectorAll(".posting-category>td")];
    const profileArea = [...document.querySelectorAll(".profile-area>td>img")];
    const boardNo = document.querySelectorAll(".profile-area input[name=boardNo]");
    const userNo = document.querySelectorAll(".profile-area input[name=userNo]");
    const boardNoList = [], userNoList = [];

    boardNo.forEach((bNo) => {boardNoList.push(bNo.value)});
    userNo.forEach((uNo) => {userNoList.push(uNo.value)});

    for(let i = 0; i < boardNoList.length; i++) {
        drawBtn(btnArea[i], boardNoList[i]);
        drawProfile(profileArea[i], userNoList[i])
    }
}

// 왼쪽 커뮤니티 대분류 항목 그리기
function setNav(result) {
    const ul = document.getElementById("community-nav");
    ul.innerHTML += `<li class="write-btn" onclick="location.href='main.cm'">
                        <h2>커뮤니티 메인</h2>
                    </li>`;

    for(let ele of result) {
        const li = document.createElement("li");
        const h2 = document.createElement("h2");
        const input = document.createElement("input");
        
        li.setAttribute("class", "community-nav-li");
        li.addEventListener("click", (ev) => {

        });
        
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

// 클릭한 곳 글자 칠하기 - 미구현
function setColor() {
    const communityNav = document.getElementsByClassName("community-nav-li");
    for(let i = 0; i < communityNav.length; i++) {
        if(communityNav.item(i));
    }
}

// 게시글마다 해당하는 카테고리 노출하기
function drawBtn(_this, bNo) {
    boardCategory({boardNo: bNo}, (result) => {
        for(let c of result) {
            _this.innerHTML += `<button class="btn-staez checked"><h4>${c.categoryName}</h4></button>`
        }
    });
}

// 게시글마다 프로필 사진 그리기
function drawProfile(_this, uNo) {
    selectProfile({userNo: uNo}, (result) => {
        _this.setAttribute("src", contextPath + result);
    })
}