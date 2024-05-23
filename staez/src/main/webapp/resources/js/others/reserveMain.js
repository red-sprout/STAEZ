window.onload = function(){
    const body = document.querySelector("body");
    body.classList.add("noScroll");
    mainCategoryName((category) => drawOption(category));


    function drawOption(category){
        const select1 = document.getElementById("popularity-concert-category-box");
        const select2 = document.getElementById("latest-concert-category-box");
        
        for (let c of category){
            select1.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`;
            select2.innerHTML += `<option value="`+c.categoryNo+`">`+c.categoryName+`</option>`;
        }

        const categoryNo1 = document.getElementById("popularity-concert-category-box").value;
        selectPopularConcert({
            categoryNo1
        },(pcConserts) => drawPopularConcert(pcConserts));
    }
}

function drawPopularConcert(pcConserts){
    console.log(pcConserts)
    const pcConsertsArea = document.querySelector(".popularity-concert-information-slider");
    pcConsertsArea.innerHTML = ``;
    for (let c of pcConserts){
        pcConsertsArea.innerHTML += `<div class="popularity-concert-information">
                                        <a class="popularity-concert-information-a" href="${contextPath}/detail.co"><img class="popularity-concert-information-img" src="${contextPath}/resources/img/others/concert1.png" alt=""></a>
                                        <div class="concert-search-result-content-info">
                                            <span class="concert-search-result-content-span1">뮤지컬</span>
                                            <span class="concert-search-result-content-span2">[시카고]</span>
                                            <span class="concert-search-result-content-span3">2024.6.7 ~ 9.29</span>
                                        </div>
                                    </div>`
    }
}


/* 공연 리스트 슬라이드 하기 */

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

function changeLike(_this, event) {
    event.stopPropagation(); 
    const likeNo = "/staez/resources/img/others/like-no.png";
    const likeYes = "/staez/resources/img/others/like-yes.png"; 
    let img = _this.querySelector('img')
    let src = img.src;
    if(src.includes("no")){
        img.src = likeYes
    } else {
        img.src = likeNo
    } 
}
