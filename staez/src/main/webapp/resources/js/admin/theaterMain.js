window.onload = function(){
    const cPage = 1
    ajaxTheaterList({cPage},(theaterList)=>drawTheaterList(theaterList))
}

function drawTheaterList(theaterList){
    const theaterArea = document.querySelector(".admin-theater-container")
    console.log(theaterList)
    theaterArea.innerHTML =``;

    for(let t of theaterList.tlist){
        const row = decimalToBase26(t.theaterRow)
        theaterArea.innerHTML +=  `<tr>
                                    <td class="admin-checkbox">
                                        <input type="checkbox" name="" id="`+ t.theaterNo +`">
                                    </td>
                                    <td>`+ t.theaterName +`</td>
                                    <td>A `+ row +`</td>
                                    <td>1 - `+ t.theaterCol +`</td>
                                    <td>`+ t.address +`</td>
                                    <td>`+ t.telno +`</td>
                                </tr>`
    }

    const pageArea = document.querySelector(".page-list");
    const pi = theaterList.pi;
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
}

function pageArrowConcert(cPage){
    ajaxTheaterList({cPage},(concertList)=>drawTheaterList(concertList))
}

function clickpageConcert(_this){
    const cPage = _this.querySelector("h4").innerHTML;
    
    ajaxTheaterList({cPage},(concertList)=>drawTheaterList(concertList))
}