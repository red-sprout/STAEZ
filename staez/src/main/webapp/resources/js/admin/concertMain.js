$(function() {
    const cPage = 1;
    ajaxConcertContentList({ cPage }, drawConcertContentList);
});

function drawConcertContentList(concertList) {
    const cArea = document.querySelector(".admin-concert-container");
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
    checkbox.type = "checkbox";
    checkbox.id = c.concertNo;
    tdCheckbox.appendChild(checkbox);
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