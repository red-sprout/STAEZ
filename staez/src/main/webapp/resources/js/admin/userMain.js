$(function() {
    adminSelectUser({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        drawUserList(result.userList);
        drawPagination(result.pagination);
    });

    document.querySelector("#admin-search button").addEventListener("click", (ev) => searchEvent(ev));
    document.querySelector("#admin-search input").addEventListener("keypress", (ev) => searchEventEnter(ev))
    document.querySelector("#admin-delete-user").addEventListener("click", deleteUserEvent);
    document.querySelector("#admin-update-modal").addEventListener("click", (ev) => updateModal(ev));
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

// 유저 목록 그리기
function drawUserList(userList) {
    const tbody = document.getElementById("admin-contents");
    for(let user of userList) {
        const tr = drawUser(user);
        tbody.appendChild(tr);
    }
}

// 유저 하나 그리기
function drawUser(user) {
    const tr = document.createElement("tr");
    tr.setAttribute("class", "admin-posting");

    const checkbox = document.createElement("td");
    checkbox.setAttribute("class", "admin-checkbox");
    checkbox.innerHTML += `<input type="checkbox">`;
    checkbox.innerHTML += `<input type="hidden" name="userNo" value=${user.userNo}>`;
    tr.appendChild(checkbox);

    const userId = document.createElement("td");
    userId.innerHTML = user.userId;
    tr.appendChild(userId);

    const nickname = document.createElement("td");
    nickname.innerHTML = user.nickname;
    tr.appendChild(nickname);

    const grade = document.createElement("td");
    grade.innerHTML = user.grade == 1 ? "관리자" : "일반회원";
    tr.appendChild(grade);

    const phone = document.createElement("td");
    phone.innerHTML = user.phone;
    tr.appendChild(phone);

    const email = document.createElement("td");
    email.innerHTML = user.email;
    tr.appendChild(email);

    const enrollDate = document.createElement("td");
    enrollDate.innerHTML = user.enrollDate;
    tr.appendChild(enrollDate);

    return tr;
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
    
    adminPagination.appendChild(paginationDiv);
    adminContents.appendChild(adminPagination);

    paginationBefore.addEventListener("click", () => {
        if (result.currentPage > result.startPage) {
            adminSelectUser({
                select: getSelect(),
                keyword: getKeyword(),
                currentPage: result.currentPage - 1,
            }, (result) => {
                deleteNodes();
                drawUserList(result.userList);
                drawPagination(result.pagination);
            });
        }
    });
    paginationAfter.addEventListener("click", () => {
        if (result.currentPage < result.endPage) {
            adminSelectUser({
                select: getSelect(),
                keyword: getKeyword(),
                currentPage: result.currentPage + 1,
            }, (result) => {
                deleteNodes();
                drawUserList(result.userList);
                drawPagination(result.pagination);
            });
        }
    });
}

// 페이지 클릭시 이벤트
function pageEvent(ev) {
    const paginationAll = document.querySelectorAll(".pagination");
    for(let ele of paginationAll) {
        ele.classList.remove("current");
    }
    ev.currentTarget.classList.add("current");
    window.scrollTo(0, 0);

    adminSelectUser({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: ev.currentTarget.children[0].innerText,
    }, (result) => {
        deleteNodes();
        drawUserList(result.userList);
        drawPagination(result.pagination);
    });
}

// 검색시 이벤트 - 마우스 클릭
function searchEvent(ev) {
    adminSelectUser({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        deleteNodes();
        drawUserList(result.userList);
        drawPagination(result.pagination);
    })
}

// 검색시 이벤트 - 엔터키
function searchEventEnter(ev) {
    if(ev.keyCode != 13) return;
    adminSelectUser({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        deleteNodes();
        drawUserList(result.userList);
        drawPagination(result.pagination);
    })
}

// 체크박스 전체 체크
function checkboxTotalEvent(_this) {
    const checked = _this.checked;
    const userCheckbox = document.querySelectorAll("#admin-contents input[type=checkbox]");
    for(let ele of userCheckbox) {
        if(checked) {
            ele.setAttribute("checked", true);
        } else {
            ele.removeAttribute("checked");
        }
    }
}

function checkboxEvent(ev) {

}

// 모든 체크박스 확인, 처리할 유저 목록 정리
function getCheckboxChecked() {
    const result = [];
    const checked = document.querySelectorAll("#admin-contents input[type=checkbox]:checked+input[type=hidden]");
    for(let ele of checked) {
        result.push(ele.value);
    }
    return result;
}

// 유저 삭제
function deleteUserEvent() {
    const userList = getCheckboxChecked();
    if(userList.length === 0) {
        alert("한 명 이상의 이용자를 선택해주세요.")
        return;
    }
    deleteUser({
        userList: userList,
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}

// 권한 수정 모달 제어
function updateModal(ev) {
    const userList = getCheckboxChecked();
    if(userList.length !== 1) {
        alert("권한 수정시 이용자는 한 명만 선택하기 바랍니다.");
        ev.currentTarget.removeAttribute("data-toggle");
        ev.currentTarget.removeAttribute("data-target");
        return;
    }
    ev.currentTarget.setAttribute("data-toggle", "modal");
    ev.currentTarget.setAttribute("data-target", "#grade-modal");

    const modalBody = document.querySelector("#grade-modal .modal-body");
    modalBody.innerHTML = "";

    updateModalButton(modalBody, "관리자", 1);
    updateModalButton(modalBody, "일반회원", 2);
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

    for(let ele of modalBody) {
        ele.classList.remove("checked");
        ele.children[1].removeAttribute("checked");
    }

    target.classList.add("checked");
    target.children[1].setAttribute("checked", true);
}

// 유저 권한 수정
function updateUserEvent() {
    const userList = getCheckboxChecked();
    const grade = document.querySelector("#grade-modal .modal-body input[type=radio]:checked").value;
    updateGradeUser({
        userList, grade
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}