window.onload = function(){
    const cPage = 1
    ajaxConcertContentList({cPage},(concertList)=>drawConcertContentList(concertList))
}

function drawConcertContentList(concertList){
    const cArea = document.querySelector(".admin-concert-container")
    console.log(concertList)
    cArea.innerHTML = ``;
    for(let c of concertList.clist){
        cArea.innerHTML += `<tr>
                                <td class="admin-checkbox">
                                    <input type="checkbox" name="" id="`+ c.concertNo +`">
                                </td>
                                <td>`+ c.categoryName +`</td>
                                <td>`+ c.concertTitle +`</td>
                                <td class="admin-poster">
                                    <img class="poster" src="" alt="">
                                </td>
                                <td>`+ c.startDate +`</td>
                                <td>`+ c.endDate +`</td>
                                <td>`+ c.theaterName +`</td>
                            </tr>`
    }

    const pageArea = document.querySelector(".page-list");
    const pi = concertList.pi;
    pageArea.innerHTML =``;

    if(pi.currentPage == 1){
            
        pageArea.innerHTML += ` <div class="pagination" style="opacity: 0.5;">
                                    <img src="/staez/resources/img/main/before.png" />
                                </div>`
    } else {
       
        pageArea.innerHTML += `
        <div class="pagination" onclick="pageArrowConcert(` + (pi.currentPage-1) + `)">
            <img src="/staez/resources/img/main/before.png" />
        </div>`;
    }

    for(let i = pi.startPage; i <= pi.endPage; i++){
        pageArea.innerHTML += `<div class="pagination num" onclick="clickpageConcert(this)" style="cursor: pointer;"><h4>`+ i +`</h4></div>`
    }

    if(pi.currentPage === pi.maxPage){
        pageArea.innerHTML += `<div class="pagination" style="opacity: 0.5;">
                                    <img src="/staez/resources/img/main/after.png"/>
                                </div>`
    } else {
        pageArea.innerHTML += `<div class="pagination" onclick="pageArrowConcert(` + (pi.currentPage+1) + `)">
                                    <img src="/staez/resources/img/main/after.png"/>
                                </div>`
    }
    const clickPage =  document.querySelectorAll(".num");
    console.log(clickPage)
    for(let i = 0; i < clickPage; i++){
        clickPage[i].classList.remove("current")
    }
    clickPage[pi.currentPage - 1].classList.add("current")

    
    
    const cPage = concertList.pi.currentPage;
    ajaxConcertImgList({cPage},(concertImgList)=>drawConcertImgList(concertImgList))
}

function drawConcertImgList(concertImgList){
    console.log(concertImgList)
    const cImgs = document.querySelectorAll(".poster");
    for(let i = 0; i < cImgs.length; i++){
        cImgs[i].src="/staez" + concertImgList.ilist[i].filePath + concertImgList.ilist[i].changeName;
    }
}

function pageArrowConcert(cPage){
    ajaxConcertContentList({cPage},(concertList)=>drawConcertContentList(concertList))
}

function clickpageConcert(_this){
    const cPage = _this.querySelector("h4").innerHTML;
    
    ajaxConcertContentList({cPage},(concertList)=>drawConcertContentList(concertList))
}