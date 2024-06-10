$(function () {
    adminSelectReserve({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        drawReserveList(result.reserveList);
        drawPagination(result.pagination);
    });

    document.querySelector("#admin-search button").addEventListener("click", (ev) => searchEvent(ev));
    document.querySelector("#admin-search input").addEventListener("keypress", (ev) => searchEventEnter(ev));
    document.querySelector("#admin-update-reserve").addEventListener("click", () => updateReserveEvent("Y"));
    document.querySelector("#admin-delete-reserve").addEventListener("click", () => updateReserveEvent("N"));
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

// 목록 그리기
function drawReserveList(reserveList) {
    const tbody = document.getElementById("admin-contents");
    for (let reserve of reserveList) {
        const tr = drawReserve(reserve);
        tbody.appendChild(tr);
    }
}

// 하나 그리기
/*
    <td>공연명</td>
    <td>예매자이름(실명)</td>
    <td>예약일</td>
    <td>결제방법</td>
    <td>상태</td>
    <td>일정(시간)</td>
*/
function drawReserve(reserve) {
    const tr = document.createElement("tr");
    tr.setAttribute("class", "admin-posting");

    const checkbox = document.createElement("td");
    checkbox.setAttribute("class", "admin-checkbox");
    checkbox.innerHTML += `<input type="checkbox">`;
    checkbox.innerHTML += `<input type="hidden" name="reserveNo" value=${reserve.reserveNo}>`;
    tr.appendChild(checkbox);

    const reserveNo = document.createElement("td");
    reserveNo.innerHTML = reserve.reserveNo;
    tr.appendChild(reserveNo);

    const concertTitle = document.createElement("td");
    concertTitle.innerHTML = reserve.concertTitle;
    tr.appendChild(concertTitle);

    const rName = document.createElement("td");
    rName.innerHTML = reserve.rName;
    tr.appendChild(rName);

    const reserveDate = document.createElement("td");
    reserveDate.innerHTML = timeFormatForSeconds(reserve.reserveDate);
    tr.appendChild(reserveDate);

    const payment = document.createElement("td");
    payment.innerText = reserve.payMethod;
    tr.appendChild(payment);

    const status = document.createElement("td");
    console.log(reserve.reserveStatus);
    switch(reserve.reserveStatus) {
        case "Y" : 
            status.innerText = "결제완료";
            break;
        case "U": 
            status.innerText = "결제대기";
            break;
        default: status.innerText = "예매취소";
    }
    tr.appendChild(status);

    const schedule = document.createElement("td");
    schedule.innerText = reserve.schedule;
    tr.appendChild(schedule);

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

    adminSelectReserve({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: ev.currentTarget.children[0].innerText,
    }, (result) => {
        deleteNodes();
        drawReserveList(result.reserveList);
        drawPagination(result.pagination);
    });
}

// 검색시 이벤트 - 마우스 클릭
function searchEvent(ev) {
    adminSelectReserve({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        deleteNodes();
        drawReserveList(result.reserveList);
        drawPagination(result.pagination);
    });
}

// 검색시 이벤트 - 엔터키
function searchEventEnter(ev) {
    if (ev.keyCode != 13) return;
    adminSelectReserve({
        select: getSelect(),
        keyword: getKeyword(),
        currentPage: 1,
    }, (result) => {
        deleteNodes();
        drawReserveList(result.reserveList);
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
    for (let ele of checked) {
        result.push(ele.value);
    }
    return result;
}

function updateReserveEvent(reserveStatus) {
    const reserveList = getCheckboxChecked();
    if (reserveList.length === 0) {
        alert("하나 이상의 예매내역을 선택해주세요.")
        return;
    }
    updateReserve({
        reserveList, reserveStatus
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}