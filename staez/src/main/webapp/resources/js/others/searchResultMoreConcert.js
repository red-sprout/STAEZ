window.onload = function(){
    const keyword = document.querySelector("input[name = 'keyword']").value;
    const cPage = 1;
    keywordMoreEndConcert({keyword, cPage},(res)=>drawConcert(res, keyword));

}

function drawConcert(res, keyword){
    const concertCount = document.querySelector(".concert-count");
    concertCount.innerHTML=``;
    concertCount.innerHTML=`공연정보(`+ res.pi.listCount +`)`;
    const concertArea = document.querySelector(".concert-search-result-area")
    const endConcertBtn = document.querySelector(".btn-staez");
    endConcertBtn.innerHTML = ``;
    endConcertBtn.innerHTML = `마감된 공연 포함`;
    concertArea.innerHTML = ``;
    if(res.cList.length === 0){
        concertArea.innerHTML = `<span style="font-size: 30px; font-weight: 500; width: 100%;">검색 결과가 없습니다</span>`
    } else {
        for(let c of res.cList){
            let categoryName;
            let mapping;
            if(c.categoryNo === 0){
                categoryName = "연극"
                mapping = `condeapi.co?concertId=`+c.concertPlot;
            }else{
                categoryName = c.categoryName;
                mapping = `detail.co?concertNo=`+ c.concertNo;
            }
            concertArea.innerHTML += `<div class="concert-search-result-info">
                                        <a href="${mapping}"><img class="concert-img" src="" alt=""></a>
                                        <div class="concert-search-result-content-info">
                                            <span class="concert-search-result-content-span1">`+ categoryName +`</span>
                                            <span class="concert-search-result-content-span2">[`+ c.concertTitle +`]</span>
                                            <span class="concert-search-result-content-span3">`+ c.startDate +` ~ `+ c.endDate +`</span>
                                        </div>
                                    </div>`;  
        }
        const cPage = res.pi.currentPage;
        keywordMoreEndConcertImg({keyword, cPage}, (res)=>drawConcertImg(res))
    }
    if(res.cList){
        const pi = res.pi;
        const pageArea = document.querySelector(".page-list");
        pageArea.innerHTML = ``
        if(pi.currentPage == 1){
            
            pageArea.innerHTML += ` <div class="pagination" style="opacity: 0.5;">
                                        <img src="/staez/resources/img/main/before.png" />
                                    </div>`
        } else {
           
            pageArea.innerHTML += `
            <div class="pagination" onclick="pageArrowConcert1(` + (pi.currentPage-1) + `)">
                <img src="/staez/resources/img/main/before.png" />
            </div>`;
        }

        for(let i = pi.startPage; i <= pi.endPage; i++){
            pageArea.innerHTML += `<div class="pagination num" onclick="clickpageConcert1(this)" style="cursor: pointer;"><h4>`+ i +`</h4></div>`
        }

        if(pi.currentPage === pi.maxPage){
            pageArea.innerHTML += `<div class="pagination" style="opacity: 0.5;">
                                        <img src="/staez/resources/img/main/after.png"/>
                                    </div>`
        } else {
            pageArea.innerHTML += `<div class="pagination" onclick="pageArrowConcert1(` + (pi.currentPage+1) + `)">
                                        <img src="/staez/resources/img/main/after.png"/>
                                    </div>`
        }
        const clickPage =  document.querySelectorAll(".num");
        console.log(clickPage)
        for(let i = 0; i < clickPage; i++){
            clickPage[i].classList.remove("current")
        }
        clickPage[pi.currentPage - 1].classList.add("current")
    } else {
        pageArea.innerHTML = ``;
    }
}

function pageArrowConcert1(cPage){
    const keyword = document.querySelector("input[name = 'keyword']").value;
    keywordMoreEndConcert({keyword, cPage},(res)=>drawConcert(res, keyword));
}

function clickpageConcert1(_this){
    const keyword = document.querySelector("input[name = 'keyword']").value;
    const cPage = _this.querySelector("h4").innerHTML;

    keywordMoreEndConcert({keyword, cPage},(res)=>drawConcert(res, keyword));
}

function drawConcertImg(res){
    console.log(res.ciList)
    const concertImg = document.querySelectorAll(".concert-img")
    for(let i = 0; i < concertImg.length; i++){
        if(res.ciList[i].originName === 'api'){
            concertImg[i].src=res.ciList[i].filePath;
        }else{
            concertImg[i].src="/staez" + res.ciList[i].filePath + res.ciList[i].changeName;
        }
    }
}

function noEndConcert(){
    const btn = document.querySelector(".end-concert");
    const keyword = document.querySelector("input[name = 'keyword']").value;
    const cPage = 1;
    
    if(btn.classList.contains("checked")){
        btn.classList.remove("checked")
        keywordMoreConcert({keyword, cPage},(res)=>drawNoEndConcert(res, keyword));
    } else {
        btn.classList.add("checked")
        keywordMoreEndConcert({keyword, cPage},(res)=>drawConcert(res, keyword));
    }
}

function drawNoEndConcert(res, keyword){
    const concertCount = document.querySelector(".concert-count");
    concertCount.innerHTML=``;
    concertCount.innerHTML=`공연정보(`+ res.pi.listCount +`)`;
    const concertArea = document.querySelector(".concert-search-result-area")
    const endConcertBtn = document.querySelector(".btn-staez");
    endConcertBtn.innerHTML = ``;
    endConcertBtn.innerHTML = `마감된 공연 미포함`;
    concertArea.innerHTML = ``;
    if(res.cList.length === 0){
        concertArea.innerHTML = `<span style="font-size: 30px; font-weight: 500; width: 100%;">검색 결과가 없습니다</span>`
    } else {
        for(let c of res.cList){
            let categoryName;
            let mapping;
            if(c.categoryNo === 0){
                categoryName = "연극"
                mapping = `condeapi.co?concertId=`+c.concertPlot;
            }else{
                categoryName = c.categoryName;
                mapping = `detail.co?concertNo=`+ c.concertNo;
            }
            concertArea.innerHTML += `<div class="concert-search-result-info">
                                        <a href="${mapping}"><img class="concert-img" src="" alt=""></a>
                                        <div class="concert-search-result-content-info">
                                            <span class="concert-search-result-content-span1">`+ categoryName +`</span>
                                            <span class="concert-search-result-content-span2">[`+ c.concertTitle +`]</span>
                                            <span class="concert-search-result-content-span3">`+ c.startDate +` ~ `+ c.endDate +`</span>
                                        </div>
                                    </div>`;  
        }
        const cPage = res.pi.currentPage;
        keywordMoreConcertImg({keyword, cPage}, (res)=>drawMoreConcertImg(res))
    }
    if(res.cList){
        const pi = res.pi;
        const pageArea = document.querySelector(".page-list");
        pageArea.innerHTML = ``
        if(pi.currentPage == 1){
            
            pageArea.innerHTML += ` <div class="pagination" style="opacity: 0.5;">
                                        <img src="/staez/resources/img/main/before.png" />
                                    </div>`
        } else {
           
            pageArea.innerHTML += `
            <div class="pagination" onclick="pageArrowConcert2(` + (pi.currentPage-1) + `)">
                <img src="/staez/resources/img/main/before.png" />
            </div>`;
        }

        for(let i = pi.startPage; i <= pi.endPage; i++){
            pageArea.innerHTML += `<div class="pagination num" onclick="clickpageConcert2(this)" style="cursor: pointer;"><h4>`+ i +`</h4></div>`
        }

        if(pi.currentPage === pi.maxPage){
            pageArea.innerHTML += `<div class="pagination" style="opacity: 0.5;">
                                        <img src="/staez/resources/img/main/after.png"/>
                                    </div>`
        } else {
            pageArea.innerHTML += `<div class="pagination" onclick="pageArrowConcert2(` + (pi.currentPage+1) + `)">
                                        <img src="/staez/resources/img/main/after.png"/>
                                    </div>`
        }
        const clickPage =  document.querySelectorAll(".num");

        for(let i = 0; i < clickPage; i++){
            clickPage[i].classList.remove("current")
        }
        clickPage[pi.currentPage - 1].classList.add("current")
    } else {
        pageArea.innerHTML = ``;
    }
}

function drawMoreConcertImg(res){
    console.log("이미지 리스트 : " + res.ciList)
    const concertImg = document.querySelectorAll(".concert-img")
    for(let i = 0; i < concertImg.length; i++){
        if(res.ciList[i].originName === 'api'){
            concertImg[i].src=res.ciList[i].filePath;
        }else{
            concertImg[i].src="/staez" + res.ciList[i].filePath + res.ciList[i].changeName;
        }
    } 
}

function pageArrowConcert2(cPage){
    const keyword = document.querySelector("input[name = 'keyword']").value;
    keywordMoreConcert({keyword, cPage},(res)=>drawNoEndConcert(res, keyword));
}

function clickpageConcert2(_this){
    const keyword = document.querySelector("input[name = 'keyword']").value;
    const cPage = _this.querySelector("h4").innerHTML;

    keywordMoreConcert({keyword, cPage},(res)=>drawNoEndConcert(res, keyword));
}



