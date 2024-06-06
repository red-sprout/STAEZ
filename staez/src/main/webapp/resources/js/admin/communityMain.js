$(function () {
    adminSelectCommunity({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        drawCommunityList(result.communityList);
        drawPagination(result.pagination);
    });

    document.querySelector("#admin-search button").addEventListener("click", (ev) => searchEvent(ev));
    document.querySelector("#admin-search input").addEventListener("keypress", (ev) => searchEventEnter(ev));
    document.querySelector("#admin-delete-community").addEventListener("click", deleteCommunityEvent);
    document.querySelector("#admin-div-modal").addEventListener("click", (ev) => updateModal(ev, 1, "div"));
    document.querySelector("#admin-genre-modal").addEventListener("click", (ev) => updateModal(ev, 2, "genre"));
})

function getSelect() {
    const selectBox = document.querySelector("#admin-header select");
    return selectBox.options[selectBox.selectedIndex].value;
}

function getKeyword() {
    return document.querySelector("#admin-search input").value;
}

// 기존 그려진 요소 삭제
function deleteNodes() {
    const wrapper = document.getElementById("admin-main-wrapper");
    const adminPagination = document.getElementById("admin-pagination");
    const tbody = document.getElementById("admin-contents");

    wrapper.removeChild(adminPagination);
    tbody.innerHTML = "";
}

// 커뮤니티 목록 그리기
function drawCommunityList(communityList) {
    const tbody = document.getElementById("admin-contents");
    for (let board of communityList) {
        const tr = drawBoard(board);
        tbody.appendChild(tr);
    }
}

// 커뮤니티 하나 그리기
function drawBoard(board) {
    const tr = document.createElement("tr");
    tr.setAttribute("class", "admin-posting");

    const checkbox = document.createElement("td");
    checkbox.setAttribute("class", "admin-checkbox");
    checkbox.innerHTML += `<input type="checkbox">`;
    checkbox.innerHTML += `<input type="hidden" name="boardNo" value=${board.boardNo}>`;
    tr.appendChild(checkbox);

    const userId = document.createElement("td");
    userId.innerHTML = board.userId;
    tr.appendChild(userId);

    const nickname = document.createElement("td");
    nickname.innerHTML = board.nickname;
    tr.appendChild(nickname);

    const title = document.createElement("td");
    title.innerHTML = simpleTextView(board.boardTitle);
    tr.appendChild(title);

    const content = document.createElement("td");
    content.innerText = simpleTextView(board.boardContent);
    tr.appendChild(content);

    return tr;
}

// 글자 수 줄이기, 태그 제거
function simpleTextView(realValue) {
    let result = realValue;
    removableTags.forEach((tag) => result = result.replaceAll(tag, " "));
    if (result.length > 20) {
        result = result.substring(0, 20);
        result += "...";
    }
    return result;
}

// 페이지네이션 그리기
function drawPagination(result) {
    const adminContents = document.getElementById("admin-main-wrapper");

    const adminPagination = document.createElement("li");
    adminPagination.setAttribute("id", "admin-pagination");
    adminPagination.setAttribute("class", "admin-middle");

    const paginationDiv = document.createElement("div");
    paginationDiv.setAttribute("class", "page-list");

    const paginationBefore = document.createElement("div");
    paginationBefore.setAttribute("class", "pagination");
    paginationBefore.innerHTML += `<img src="${contextPath}resources/img/main/before.png">`
    paginationDiv.appendChild(paginationBefore);

    for (let page = result.startPage; page <= result.endPage; page++) {
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

    adminPagination.appendChild(paginationDiv);
    adminContents.appendChild(adminPagination);
}

// 페이지 클릭시 이벤트
function pageEvent(ev) {
    const paginationAll = document.querySelectorAll(".pagination");
    for (let ele of paginationAll) {
        ele.classList.remove("current");
    }
    ev.currentTarget.classList.add("current");
    window.scrollTo(0, 0);

    adminSelectCommunity({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: ev.currentTarget.children[0].innerText,
    }, (result) => {
        deleteNodes();
        drawCommunityList(result.communityList);
        drawPagination(result.pagination);
    });
}

// 검색시 이벤트 - 마우스 클릭
function searchEvent(ev) {
    adminSelectCommunity({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        deleteNodes();
        drawCommunityList(result.communityList);
        drawPagination(result.pagination);
    });
}

// 검색시 이벤트 - 엔터키
function searchEventEnter(ev) {
    if (ev.keyCode != 13) return;
    adminSelectCommunity({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        deleteNodes();
        drawCommunityList(result.communityList);
        drawPagination(result.pagination);
    });
}

// 체크박스 전체 체크
function checkboxTotalEvent(_this) {
    const checked = _this.checked;
    const boardCheckbox = document.querySelectorAll("#admin-contents input[type=checkbox]");
    for (let ele of boardCheckbox) {
        if (checked) {
            ele.setAttribute("checked", true);
        } else {
            ele.removeAttribute("checked");
        }
    }
}

function checkboxEvent(ev) {

}

// 모든 체크박스 확인, 처리할 커뮤니티 목록 정리
function getCheckboxChecked() {
    const result = [];
    const checked = document.querySelectorAll("#admin-contents input[type=checkbox]:checked+input[type=hidden]");
    for (let ele of checked) {
        result.push(ele.value);
    }
    return result;
}

// 모든 카테고리 확인
function getCategoryChecked(id) {
    const result = [];
    const checked = document.querySelectorAll(`#${id} input[type=radio]:checked`);
    for(let ele of checked) {
        result.push(ele.value);
    }
    return result;
}

// 커뮤니티 삭제
function deleteCommunityEvent() {
    const boardList = getCheckboxChecked();
    if (boardList.length === 0) {
        alert("한 명 이상의 이용자를 선택해주세요.")
        return;
    }
    deleteCommunity({
        boardList,
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}

// 장르 수정 모달 제어
function updateModal(ev, categoryLevel, id) {
    const boardList = getCheckboxChecked();
    if (boardList.length !== 1) {
        alert("카테고리 수정시 한 게시글만 선택하기 바랍니다.");
        ev.currentTarget.removeAttribute("data-toggle");
        ev.currentTarget.removeAttribute("data-target");
        return;
    }
    ev.currentTarget.setAttribute("data-toggle", "modal");
    ev.currentTarget.setAttribute("data-target", `#${id}-modal`);

    const modalBody = document.querySelector(`#${id}-modal .modal-body`);
    modalBody.innerHTML = "";

    communityCategory({
        refCategoryNo: refCategoryMap.community,
        categoryLevel
    }, (result) => {
        setCategory(result, `community-${id}`);
    });
}

// 권한 수정 모달의 권한 버튼 추가 및 이벤트 부여
function updateModalButton(parent, name, value) {
    const btn = document.createElement("button");
    btn.setAttribute("class", "btn-staez");
    btn.setAttribute("type", "button");
    btn.innerHTML += `<h3>${name}</h3><input type="radio" class="hidden" value="${value}">`
    parent.appendChild(btn);

    btn.addEventListener("click", (ev) => {
        updateGradeBtnToggle(ev.currentTarget);
    });
}

// 권한 수정 버튼 토클
function updateGradeBtnToggle(target) {
    const modalBody = document.querySelector("#grade-modal .modal-body").children;

    for (let ele of modalBody) {
        ele.classList.remove("checked");
        ele.children[1].removeAttribute("checked");
    }

    target.classList.add("checked");
    target.children[1].setAttribute("checked", true);
}

// 커뮤니티 카테고리 수정
function updateCategoryEvent(id, categoryLevel) {
    const boardList = getCheckboxChecked();
    const categoryNo = document.querySelector(`#community-${id} input[type=radio]:checked`).value;
    updateCategoryCommunity({
        boardList, categoryNo, categoryLevel
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}