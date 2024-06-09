$(function() {
    // 버튼으로 구성된 카테고리 설정
    noticeCategory({refCategoryNo: refCategoryMap.others, categoryLevel: 1}, (res) => {
        setCategory(res, 'category-div');
        const btnStaez = document.querySelectorAll("#category-div button");
        for(let ele of btnStaez) {
            ele.addEventListener("click", (ev) => btnEvent(ev));
        }
    });

    noticeMainList({
        categoryNo: noticeCategoryNo(),
        cPage: 1, 
        select: getSelectedOption(),
        keyword: document.querySelector("#notice-search input[name=keyword]").value
    }, (result) => {
        drawBoard(result.boardList);
        pagination(result.pagination);
    });

    document.querySelector("#notice-search button").addEventListener("click", (ev) => searchEvent(ev));
    document.querySelector("#notice-search input[name=keyword]").addEventListener("keypress", (ev) => searchEventEnter(ev));
})

function getSelectedOption() {
    const selectBox = document.querySelector("#notice-header select");
    return selectBox.options[selectBox.selectedIndex].value;
}

// 기존 그려진 요소 삭제
function deleteNodes() {
    const contents = document.getElementById("notice-contents");
    const noticePagination = document.querySelector("#notice-pagination");
    const posting = document.querySelectorAll(".notice-posting")

    contents.removeChild(noticePagination);
    for(let ele of posting) {
        contents.removeChild(ele);
    }
}

// 체크된 카테고리 가져오기
function noticeCategoryNo() {
    const radio = document.querySelectorAll("input[type=radio]");
    for(let ele of radio) {
        if(parseInt(ele.value) === 0) {
            continue;
        }
        if(ele.checked) {
            return ele.value;
        }
    }
    return null;
}

// 요소 그리기
function drawBoard(result) {
    const noticeContents = document.getElementById("notice-contents");
    for(let n of result) {
        const li = noticePosting(n.boardNo);
        const table = tableTag(n);
        li.appendChild(table)
        noticeContents.appendChild(li);
    }
    initBoardList();
}

// li 태그 그리기 - 게시글 한 요소
function noticePosting(boardNo) {
    const li = document.createElement("li");
    li.setAttribute("class", "notice-posting");
    li.addEventListener("click", (ev) => {
        location.href = `detail.no?boardNo=${boardNo}`;
    });
    return li;
}

// table 태그 그리기 - 게시글 한 요소 내용
function tableTag(board) {
    const table = document.createElement("table");
    const tbody = tableRows(board);
    table.appendChild(tbody);
    return table;
}

// tr 태그 그리기 - 게시글 한 요소 상세 내용
function tableRows(board) {
    const result = document.createElement("tbody");

    const profileArea = profile(board);
    profileArea.setAttribute("class", "profile-area");
    result.appendChild(profileArea);

    const writeDate = document.createElement("tr");
    writeDate.innerHTML += `<td>${timeFormatForSeconds(board.boardWriteDate)}</td>`;
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

// 게시글별 기본정보 표시
function profile(board) {
    const tRow = document.createElement("tr");

    const profileImg = document.createElement("td");
    profileImg.setAttribute("rowspan", 2);
    profileImg.setAttribute("width", "60px");
    profileImg.innerHTML += `<img src="${contextPath}resources/uploadfiles/profile/no-data.png" alt=""></img>`;
    tRow.appendChild(profileImg);

    const nickname = document.createElement("td");
    nickname.innerHTML += `<h4>${board.nickname}</h4>`;
    tRow.appendChild(nickname);

    const hidden = document.createElement("td");
    hidden.setAttribute("rowspan", 5);
    hidden.innerHTML += `
        <input type="hidden" name="boardNo" value="${board.boardNo}" class="boardNo">
        <input type="hidden" name="userNo" value="${board.userNo}" class="userNo">
    `;
    tRow.appendChild(hidden);

    return tRow;
}

// 게시글별 기본 프로필, 카테고리 표시 전 유저 정보 넣는 과정
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

// 게시글마다 해당하는 카테고리 노출하기
function drawBtn(_this, bNo) {
    noticeBoardCategory({boardNo: bNo}, (result) => {
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

// 페이지네이션 그리기
function pagination(result) {
    const noticeContents = document.getElementById("notice-contents");

    const noticePagination = document.createElement("li");
    noticePagination.setAttribute("id", "notice-pagination");

    const paginationDiv = document.createElement("div");
    paginationDiv.setAttribute("class", "page-list");
    
    const paginationBefore = document.createElement("div");
    paginationBefore.setAttribute("class", "pagination");
    paginationBefore.innerHTML += `<img src="${contextPath}resources/img/main/before.png">`
    paginationDiv.appendChild(paginationBefore);

    for(let page = result.startPage; page <= result.endPage; page++) {
        const paginationEle = document.createElement("div");
        paginationEle.setAttribute("class", page === result.currentPage ? "pagination current" : "pagination");
        paginationEle.innerHTML += `<h4>${page}</h4>`;
        paginationDiv.appendChild(paginationEle);
        paginationEle.addEventListener("click", (ev) => pageEvent(ev));
    }
    
    const paginationAfter = document.createElement("div");
    paginationAfter.setAttribute("class", "pagination");
    paginationAfter.innerHTML += `<img src="${contextPath}resources/img/main/after.png">`
    paginationDiv.appendChild(paginationAfter);
    
    noticePagination.appendChild(paginationDiv);
    noticeContents.appendChild(noticePagination);
}

// 페이지 클릭시 이벤트
function pageEvent(ev) {
    const paginationAll = document.querySelectorAll(".pagination");
    for(let ele of paginationAll) {
        ele.classList.remove("current");
    }
    ev.currentTarget.classList.add("current");
    window.scrollTo(0, 0);

    noticeMainList({
        categoryNo: noticeCategoryNo(),
        cPage: ev.currentTarget.children[0].innerText,
        select: document.querySelector("#notice-select option:selected").value,
        keyword: document.querySelector("#notice-search input[name=keyword]").value
    }, (result) => {
        deleteNodes();
        drawBoard(result.boardList);
        pagination(result.pagination);
    })
}

// 카테고리 버튼 클릭시 이벤트
function btnEvent(ev) {
    noticeMainList({
        categoryNo: noticeCategoryNo(),
        cPage: 1,
        select: getSelectedOption(),
        keyword: document.querySelector("#notice-search input[name=keyword]").value
    }, (result) => {
        deleteNodes();
        drawBoard(result.boardList);
        pagination(result.pagination);
    })
}

// 검색시 이벤트
function searchEvent(ev) {
    noticeMainList({
        categoryNo: noticeCategoryNo(),
        cPage: 1,
        select: getSelectedOption(),
        keyword: document.querySelector("#notice-search input[name=keyword]").value
    }, (result) => {
        deleteNodes();
        drawBoard(result.boardList);
        pagination(result.pagination);
    })
}

// 검색시 이벤트
function searchEventEnter(ev) {
    if(ev.keyCode != 13) return;
    noticeMainList({
        categoryNo: noticeCategoryNo(),
        cPage: 1,
        select: getSelectedOption(),
        keyword: document.querySelector("#notice-search input[name=keyword]").value
    }, (result) => {
        deleteNodes();
        drawBoard(result.boardList);
        pagination(result.pagination);
    })
}