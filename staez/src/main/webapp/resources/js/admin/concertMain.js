$(function() {
    const cPage = 1;
    ajaxConcertContentList({ cPage }, drawConcertContentList);

    document.getElementById("concert-update").addEventListener("click", updateConcertFormEvent);
    document.getElementById("concert-attachment-update").addEventListener("click", (ev) => updateConcertAttachmentForm(ev));
    document.getElementById("concert-delete").addEventListener("click", deleteConcertEvent);
});

function drawConcertContentList(concertList) {
    const cArea = document.querySelector("#admin-contents");
    cArea.innerHTML = '';
    concertList.clist.forEach(c => cArea.appendChild(createConcertRow(c)));
    drawPagination(concertList.pi);
    const cPage = concertList.pi.currentPage;
    ajaxConcertImgList({ cPage }, drawConcertImgList);
}

function createConcertRow(c) {
    const tr = document.createElement("tr");

    const tdCheckbox = document.createElement("td");
    tdCheckbox.className = "admin-checkbox";
    const checkbox = document.createElement("input");
    const concertNo = document.createElement("input");
    checkbox.type = "checkbox";
    concertNo.type = "hidden";
    concertNo.value = c.concertNo;

    tdCheckbox.appendChild(checkbox);
    tdCheckbox.appendChild(concertNo);
    tr.appendChild(tdCheckbox);

    const tdCategory = document.createElement("td");
    tdCategory.textContent = c.categoryName;
    tr.appendChild(tdCategory);

    const tdTitle = document.createElement("td");
    tdTitle.textContent = c.concertTitle;
    tr.appendChild(tdTitle);

    const tdPoster = document.createElement("td");
    tdPoster.className = "admin-poster";
    const img = document.createElement("img");
    img.className = "poster";
    img.alt = "";
    tdPoster.appendChild(img);
    tr.appendChild(tdPoster);

    const tdStartDate = document.createElement("td");
    tdStartDate.textContent = c.startDate;
    tr.appendChild(tdStartDate);

    const tdEndDate = document.createElement("td");
    tdEndDate.textContent = c.endDate;
    tr.appendChild(tdEndDate);

    const tdTheaterName = document.createElement("td");
    tdTheaterName.textContent = c.theaterName;
    tr.appendChild(tdTheaterName);

    return tr;
}

function drawPagination(pi) {
    const pageArea = document.querySelector(".page-list");
    pageArea.innerHTML = '';
    pageArea.appendChild(createPageArrow(pi.currentPage - 1, pi.currentPage === 1, "before"));
    for (let i = pi.startPage; i <= pi.endPage; i++) {
        pageArea.appendChild(createPageNumber(i, pi.currentPage));
    }
    pageArea.appendChild(createPageArrow(pi.currentPage + 1, pi.currentPage === pi.maxPage, "after"));
}

function createPageArrow(page, disabled, direction) {
    const div = document.createElement("div");
    div.className = "pagination";
    if (disabled) {
        div.style.opacity = 0.5;
    } else {
        div.onclick = () => pageArrowConcert(page);
    }
    const img = document.createElement("img");
    img.src = `/staez/resources/img/main/${direction}.png`;
    div.appendChild(img);
    return div;
}

function createPageNumber(page, currentPage) {
    const div = document.createElement("div");
    div.className = `pagination num ${page === currentPage ? 'current' : ''}`;
    div.style.cursor = 'pointer';
    div.innerHTML = `<h4>${page}</h4>`;
    div.onclick = () => clickpageConcert(page);
    return div;
}

function drawConcertImgList(concertImgList) {
    const cImgs = document.querySelectorAll(".poster");
    concertImgList.ilist.forEach((img, i) => {
        if (cImgs[i]) {
            cImgs[i].src = `/staez${img.filePath}${img.changeName}`;
        }
    });
}

function pageArrowConcert(cPage) {
    ajaxConcertContentList({ cPage }, drawConcertContentList);
}

function clickpageConcert(cPage) {
    ajaxConcertContentList({ cPage }, drawConcertContentList);
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

function updateConcertFormEvent() {
    const concertList = getCheckboxChecked();
    if (concertList.length !== 1) {
        alert("수정시 하나만 선택하기 바랍니다.");
        return;
    }
    location.href = `concertUpdateForm.ad?concertNo=${concertList[0]}`;
}

function deleteConcertEvent() {
    const concertList = getCheckboxChecked();
    if (concertList.length === 0) {
        alert("한 개 이상의 공연을 선택해주세요.")
        return;
    }
    deleteConcert({
        concertList,
    }, (msg) => {
        alert(msg);
        location.reload();
    })
}

function updateConcertAttachmentForm(ev) {
    const concertList = getCheckboxChecked();
    if (concertList.length !== 1) {
        alert("권한 수정시 이용자는 한 명만 선택하기 바랍니다.");
        ev.currentTarget.removeAttribute("data-toggle");
        ev.currentTarget.removeAttribute("data-target");
        return;
    }
    ev.currentTarget.setAttribute("data-toggle", "modal");
    ev.currentTarget.setAttribute("data-target", "#attachment-modal");

    document.querySelector("#attachment-modal input[type=hidden]").value = concertList[0];
}