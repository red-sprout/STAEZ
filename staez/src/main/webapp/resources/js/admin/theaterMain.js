$(function() {
    const cPage = 1;
    ajaxTheaterList({ keyword: getKeyword(), cPage }, drawTheaterList);
    document.querySelector("#admin-search button").addEventListener("click", (ev) => searchEvent(ev));
    document.querySelector("#admin-search input").addEventListener("keypress", (ev) => searchEventEnter(ev));
    document.getElementById("theater-update").addEventListener("click", updateTheaterFormEvent);
    document.getElementById("theater-delete").addEventListener("click", deleteTheaterEvent);
});

function getKeyword() {
    return document.querySelector("#admin-search input").value;
}

// 검색시 이벤트 - 마우스 클릭
function searchEvent(ev) {
    ajaxTheaterList({ keyword: getKeyword(), cPage: 1 }, drawTheaterList);
}

// 검색시 이벤트 - 엔터키
function searchEventEnter(ev) {
    if (ev.keyCode != 13) return;
    ajaxTheaterList({ keyword: getKeyword(), cPage: 1 }, drawTheaterList);
}

function drawTheaterList(theaterList) {
    const theaterArea = document.querySelector("#admin-contents");
    theaterArea.innerHTML = '';
    theaterList.tlist.forEach(t => theaterArea.appendChild(createTheaterRow(t)));
    drawPagination(theaterList.pi, pageArrowTheater, clickpageTheater);
}

function createTheaterRow(t) {
    const tr = document.createElement("tr");

    const tdCheckbox = document.createElement("td");
    tdCheckbox.className = "admin-checkbox";
    const checkbox = document.createElement("input");
    const theaterNo = document.createElement("input");
    checkbox.type = "checkbox";
    theaterNo.type = "hidden";
    theaterNo.value = t.theaterNo;

    tdCheckbox.appendChild(checkbox);
    tdCheckbox.appendChild(theaterNo);
    tr.appendChild(tdCheckbox);

    const tdName = document.createElement("td");
    tdName.textContent = t.theaterName;
    tr.appendChild(tdName);

    const tdRow = document.createElement("td");
    tdRow.textContent = `A - ${decimalToBase26(t.theaterRow)}`;
    tr.appendChild(tdRow);

    const tdCol = document.createElement("td");
    tdCol.textContent = `1 - ${t.theaterCol}`;
    tr.appendChild(tdCol);

    const tdAddress = document.createElement("td");
    tdAddress.textContent = t.address;
    tr.appendChild(tdAddress);

    const tdTelno = document.createElement("td");
    tdTelno.textContent = t.telno;
    tr.appendChild(tdTelno);

    return tr;
}

function drawPagination(pi, pageArrowFunction, clickpageFunction) {
    const pageArea = document.querySelector(".page-list");
    pageArea.innerHTML = '';
    pageArea.appendChild(createPageArrow(pi.currentPage - 1, pi.currentPage === 1, "before", pageArrowFunction));
    for (let i = pi.startPage; i <= pi.endPage; i++) {
        pageArea.appendChild(createPageNumber(i, pi.currentPage, clickpageFunction));
    }
    pageArea.appendChild(createPageArrow(pi.currentPage + 1, pi.currentPage === pi.maxPage, "after", pageArrowFunction));
}

function createPageArrow(page, disabled, direction, pageArrowFunction) {
    const div = document.createElement("div");
    div.className = "pagination";
    if (disabled) {
        div.style.opacity = 0.5;
    } else {
        div.onclick = () => pageArrowFunction(page);
    }
    const img = document.createElement("img");
    img.src = `/staez/resources/img/main/${direction}.png`;
    div.appendChild(img);
    return div;
}

function createPageNumber(page, currentPage, clickpageFunction) {
    const div = document.createElement("div");
    div.className = `pagination num ${page === currentPage ? 'current' : ''}`;
    div.style.cursor = 'pointer';
    div.innerHTML = `<h4>${page}</h4>`;
    div.onclick = () => clickpageFunction(page);
    return div;
}

function pageArrowTheater(cPage) {
    ajaxTheaterList({keyword: getKeyword(), cPage }, drawTheaterList);
}

function clickpageTheater(cPage) {
    ajaxTheaterList({keyword: getKeyword(), cPage }, drawTheaterList);
}

function updateTheaterFormEvent() {
    const theaterList = getCheckboxChecked();
    if (theaterList.length !== 1) {
        alert("수정시 하나만 선택하기 바랍니다.");
        return;
    }
    location.href=`theaterUpdateForm.ad?theaterNo=${theaterList[0]}`;
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

function deleteTheaterEvent() {
    const theaterList = getCheckboxChecked();
    if (theaterList.length === 0) {
        alert("한 개 이상의 공연장을 선택해주세요.")
        return;
    }
    deleteTheater({
        theaterList,
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}