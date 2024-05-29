window.onload = function(){
    const body = document.querySelector("body");
    body.classList.add("noScroll");
    mainCategoryName((category) => drawOption(category));
    mainPopularBoardList((bList) => drawBoardListContent(bList));
}

function drawOption(category){
    const select1 = document.getElementById("popularity-concert-category-box");
    const select2 = document.getElementById("latest-concert-category-box");
    
    for (let c of category){
        select1.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`;
        select2.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`;
    }

    select1.onchange = function() {
        const categoryNo1 = this.value;
        selectPopularConcert({
            categoryNo1
        },(pcConcerts) => drawPopularConcert(pcConcerts, categoryNo1));
    };

    select2.onchange = function() {
        const categoryNo2 = this.value;
        selectLatestConcert({
            categoryNo2
        },(lcConcerts) => drawLatestConcert(lcConcerts, categoryNo2));
    };

    const categoryNo1 = document.getElementById("popularity-concert-category-box").value;
    const categoryNo2 = document.getElementById("latest-concert-category-box").value;
    selectPopularConcert({
        categoryNo1
    },(pcConcerts) => drawPopularConcert(pcConcerts, categoryNo1));

    selectLatestConcert({
        categoryNo2
    },(lcConcerts) => drawLatestConcert(lcConcerts, categoryNo2))
}
function drawPopularConcert(pcConcerts, categoryNo1){
    const pcConsertsArea = document.querySelector(".popularity-concert-information-slider");
    pcConsertsArea.innerHTML = ``;
    if(pcConcerts.length != 0){
        for (let c of pcConcerts){
            pcConsertsArea.innerHTML += `<div class="popularity-concert-information">
                                            <a class="popularity-concert-information-a" href="/staez/detail.co?concertNo=`+ c.concertNo +`"><img class="popularity-concert-information-img" src="" alt=""></a>
                                            <div class="concert-search-result-content-info">
                                                <span class="concert-search-result-content-span1">`+ c.categoryName+`</span>
                                                <span class="concert-search-result-content-span2">[`+ c.concertTitle +`]</span>
                                                <span class="concert-search-result-content-span3">`+ c.startDate + ` ~ ` + c.endDate +`</span>
                                            </div>
                                        </div>`
        } 
        popularConcertImg(categoryNo1)
    } else{
        pcConsertsArea.innerHTML += `<span style="width: 1000px; text-align: center; font-size: 35px;">준비된 공연이 없습니다</span>`
    }
}

function popularConcertImg(categoryNo1){
    selectPopularConcertImg({
        categoryNo1
    },(concertImgs) => drawPopularConcertImg(concertImgs));
}

function drawPopularConcertImg(concertImgs){

    const imgArea = document.querySelectorAll(".popularity-concert-information-img");

    for(let i = 0; i < imgArea.length; i++){
        imgArea[i].src="/staez" + concertImgs[i].filePath + concertImgs[i].changeName;
    }
}

function drawLatestConcert(lcConcerts, categoryNo2){

    const pcConsertsArea = document.querySelector(".latest-concert-information-slider");
    pcConsertsArea.innerHTML = ``;
    if(lcConcerts != 0){
        for (let c of lcConcerts){
            pcConsertsArea.innerHTML += `<div class="latest-concert-information">
                                            <a class="latest-concert-information-a" href="/staez/detail.co?concertNo=`+ c.concertNo +`"><img class="latest-concert-information-img" src="" alt=""></a>
                                            <div class="concert-search-result-content-info">
                                                <span class="concert-search-result-content-span1">`+ c.categoryName+`</span>
                                                <span class="concert-search-result-content-span2">[`+ c.concertTitle +`]</span>
                                                <span class="concert-search-result-content-span3">`+ c.startDate + ` ~ ` + c.endDate +`</span>
                                            </div>
                                        </div>`
        }
        latestConcertImg(categoryNo2)
    } else{
        pcConsertsArea.innerHTML += `<span style="width: 1000px; text-align: center; font-size: 35px;">준비된 공연이 없습니다</span>`
    }
    
}

function latestConcertImg(categoryNo2){
    selectlatestConcertImg({
        categoryNo2
    },(concertImgs) => drawlatestConcertImg(concertImgs));
}

function drawlatestConcertImg(concertImgs){

    const imgArea = document.querySelectorAll(".latest-concert-information-img");

    for(let i = 0; i < imgArea.length; i++){
        imgArea[i].src="/staez" + concertImgs[i].filePath + concertImgs[i].changeName;
    }
    checkedButtonHidden();
}

function drawBoardListContent(bList){
   
    const boardArea = document.querySelector(".popularity-bulletin-information-area");
    boardArea.innerHTML = ``
    for(let b of bList){
        boardArea.innerHTML += `<div class="popularity-bulletin-information">
                                    <div class="popularity-bulletin-information-a" onclick="location.href='detail.cm?boardNo=`+ b.boardNo +`'">
                                        <div class="popularity-bulletin-content-area">
                                            <div class="popularity-bulletin-title">
                                                <span>`+ b.boardTitle +`</span>
                                            </div>
                                            <hr class="popularity-bulletin-hr">
                                            <div class="popularity-bulletin-detail-content">
                                                <div class="content-box">`+ b.boardContent +`</div>
                                                <div class="heart-count-area" onclick="changeLike(this, event, `+ b.boardNo +`)">
                                                    <img class="heart" src="/staez/resources/img/others/like-no.png" alt="">
                                                    <span class="heart-count">`+ b.likeCount +`</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="user-and-category-tag-area">
                                            <div class="user-profile"><img class="user-profile-img" src="" alt=""></div>
                                            <button class="btn-staez checked" style="padding: 0px 10px"><h5 class="tag"></h5></button>
                                            <button class="btn-staez checked" style="padding: 0px 10px"><h5 class="tag"></h5></button>
                                        </div>  
                                    </div>
                                </div>`
    }

    popularBoardCategory((boardCategory) => drawBoardListContentCategory(boardCategory));
}

function drawBoardListContentCategory(boardCategory){
    const  categoryTag = document.querySelectorAll(".tag");
    console.log(categoryTag)
   for(let i = 0; i < boardCategory.length; i++){
    categoryTag[i].innerHTML = boardCategory[i].categoryName;
    categoryTag[i+1].innerHTML = boardCategory[i+1].categoryName;
    i++;
   }

   popularBoardUserProfile((profiles) => drawBoardListUserProFile(profiles));
}

function drawBoardListUserProFile(profiles){
    const imgArea = document.querySelectorAll(".user-profile-img");
    for(let p of profiles){
        imgArea[i].src="/staez" + p[i].filePath + p[i].changeName;
    }
}



/* 공연 리스트 슬라이드 하기 */

function checkedButtonHidden(){
    const pbutton = document.querySelector(".popularity-concert-information-area").querySelectorAll(".slider-btn");
    console.log(pbutton)
    const lbutton = document.querySelector(".latest-concert-information-area").querySelectorAll(".slider-btn");
    console.log(lbutton)
    const pCount = document.querySelectorAll(".popularity-concert-information");
    const lCount = document.querySelectorAll(".latest-concert-information");
    if(pCount.length < 6){
        pbutton[0].classList.add("hidden")
        pbutton[1].classList.add("hidden")
    }
    if(lCount.length < 6){
        lbutton[0].classList.add("hidden")
        lbutton[1].classList.add("hidden")
    }
}   

let currentIndex1 = 0;
const totalImg1 = 10;
const viewImg1 = 5;
const imgWidth1 =  10;

function slideLeft1() {
    if (currentIndex1 > 0) {
        currentIndex1--;
    }else{
        currentIndex1 = 5;
    }
    updateSlider1();
}

function slideRight1() {
    if (currentIndex1 < totalImg1 - viewImg1) {
        currentIndex1++;
    } else{
        currentIndex1 = 0;
    }
    updateSlider1();
}

function updateSlider1() {
    const slider = document.querySelector('.popularity-concert-information-slider');
    const offset = -(currentIndex1 * imgWidth1);
    slider.style.transform = `translateX(${offset}%)`;
}

let currentIndex2 = 0;
const totalImg2 = 10;
const viewImg2 = 5;
const imgWidth2 =  10;

function slideLeft2() {
    if (currentIndex2 > 0) {
        currentIndex2--;
    }else{
        currentIndex2 = 5;
    }
    updateSlider2();
}

function slideRight2() {
    if (currentIndex2 < totalImg2 - viewImg2) {
        currentIndex2++;
    } else{
        currentIndex2 = 0;
    }
    updateSlider2();
}

function updateSlider2() {
    const slider = document.querySelector('.latest-concert-information-slider');
    const offset = -(currentIndex2 * imgWidth2);
    slider.style.transform = `translateX(${offset}%)`;
}


/*따봉 누르기 */

function changeLike(_this, event, bNo) {
    event.stopPropagation(); 
    const likeNo = "/staez/resources/img/others/like-no.png";
    const likeYes = "/staez/resources/img/others/like-yes.png"; 
    let img = _this.querySelector('img')
    let src = img.src;
    const uNo = document.querySelector("input[name = 'userNo']").value;
    if(src.includes("no")){
        img.src = likeYes
        likeYesEv(uNo ,bNo, _this);
    } else {
        img.src = likeNo
        likeNoEv(uNo ,bNo, _this);
    } 
}

function likeYesEv(uNo ,bNo, countArea){
    insertUpdatelike({
        uNo,
        bNo
    },(likeCount) => drawLikeCount(likeCount, countArea))
}

function likeNoEv(uNo, bNo, countArea){
    updateNolike({
        uNo,
        bNo
    },(likeCount) => drawLikeCount(likeCount, countArea))
}

function drawLikeCount(likeCount, countArea){
    const countSpan = countArea.querySelector("span")
    countSpan.innerHTML = ``;
    countSpan.innerHTML = likeCount.length;
}

