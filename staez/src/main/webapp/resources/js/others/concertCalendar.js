document.addEventListener('DOMContentLoaded', () => {
    const tophtml = document.querySelector(".calendar-top h3");
    const dates = document.querySelector(".dates");
    const navs = document.querySelectorAll("#previous, #next");

    const months = [
        "01", "02", "03", "04", "05", "06",
        "07", "08", "09", "10", "11", "12"
    ];

    let date = new Date();
    let month = date.getMonth();
    let year = date.getFullYear();

    const clickedDate = document.querySelector(".concert-day span");
    
    function spanDayChange(d){
        clickedDate.parentElement.classList.remove('hidden')
        clickedDate.innerHTML = ``; 
        clickedDate.innerHTML = `${year}-${months[month]}-${String(d).padStart(2, '0')}`;
    }

    spanDayChange(date.getDate());

    function renderCalendar() {
        const startDay = new Date(year, month, 1).getDay(); // 월의 시작 요일
        
        const endDate = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날짜
        
        const endDay = new Date(year, month, endDate).getDay(); // 월의 마지막 요일
          
        const endDatePrev = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날짜
         
        let datesHtml = '';

        // 이전 달의 날짜들
        for (let i = startDay; i > 0; i--) {
            datesHtml += `<li class="inactive">${endDatePrev - i + 1}</li>`;
        }

        // 현재 달의 날짜들
        for (let i = 1; i <= endDate; i++) {
            let className =
                i === date.getDate() &&
                month === new Date().getMonth() &&
                year === new Date().getFullYear()
                    ? 'class="today clickDate clicked"'
                    : "";
            datesHtml += `<li ${className} onclick="clickDate(this)">${i}</li>`;
        }

        // 다음 달의 날짜들
        const totalDays = startDay + endDate;
        const nextDays = (totalDays % 7 === 0) ? 0 : 7 - (totalDays % 7);
        for (let i = 1; i <= nextDays; i++) {
            datesHtml += `<li class="inactive">${i}</li>`;
        }

        dates.innerHTML = datesHtml;
        tophtml.textContent = `${year}년 ${months[month]}월`;
    }

    navs.forEach(nav => {
        nav.addEventListener('click', e => {
            const btnId = e.target.id;

            if (btnId === 'previous' && month === 0) {
                year--;
                month = 11;
            } else if (btnId === 'next' && month === 11) {
                year++;
                month = 0;
            } else {
                month = btnId === "next" ? month + 1 : month - 1;
            }

            // date = new Date(year, month, new Date().getDate());
            // year = date.getFullYear();
            // month = date.getMonth();

            renderCalendar();
        });
    });


    renderCalendar();
    mainCategoryName((category) => drawCategory(category));
});




function drawCategory(category){
    
    const cbtnArea = document.querySelector(".concert-day-list-category");
    cbtnArea.innerHTML = ``
    for (let c of category){
        cbtnArea.innerHTML += `<button class="btn-staez" onclick="choiceCategory(this)"><h4 class="bs" id="`+ c.categoryNo +`">`+ c.categoryName +`</h4></button>`    
    } 
    cbtnArea.children[0].classList.add("checked");
    const choiceCbs = document.querySelector('.cbs');
    choiceCbs.innerHTML = ``;
    choiceCbs.innerHTML =  cbtnArea.children[0].querySelector(".bs").innerHTML;
    choiceCbs.id = cbtnArea.children[0].querySelector(".bs").id;
   

    const cPage = 1;
    const categoryNo = choiceCbs.id;
    const concertDate = document.querySelector('.concert-day').querySelector('span').innerHTML;
    console.log(categoryNo)
    console.log(concertDate)

    dateCategoryConcert({
        categoryNo  ,
        concertDate ,
        cPage
    },(result) => drawDateCategoryConcert(result))
}

function choiceCategory(_this){
    const categoryBtn = document.querySelector(".concert-day-list-category").querySelectorAll(".btn-staez");

    for(let i = 0; i < categoryBtn.length; i++){
        categoryBtn[i].classList.remove("checked")
    }

    _this.classList.add("checked");
    const choiceCbs = document.querySelector('.cbs');
    choiceCbs.innerHTML = ``;
    choiceCbs.innerHTML = _this.querySelector(".bs").innerHTML;
    choiceCbs.id =_this.querySelector(".bs").id;
    
    const cPage = 1;
    const concertDate = document.querySelector('.concert-day').querySelector('span').innerHTML;
    const categoryNo  = choiceCbs.id;
    clickCategoryConcert({
        categoryNo  ,
        concertDate ,
        cPage
    },(result) => drawDateCategoryConcert(result))
}

function drawDateCategoryConcert(result){
    const concertArea = document.querySelector(".concert-day-info-area");
    const concertList = result.concertList;
    
    

    concertArea.innerHTML = ``;
    if(concertList.length === 0){
        concertArea.innerHTML += `<span style="width: 100%;margin-top: 100px;font-size: 30px;">준비된 공연이 없습니다</span>`
    }
    for(let c of concertList){
        concertArea.innerHTML += `<div class="concert-day-info" onclick="location.href='detail.co?concertNo=`+ c.concertNo +`'">
                                        <div class="concert-day-title-area"><span>`+ c.concertTitle +`</span></div>
                                        <div class="concert-day-img-description-area">
                                            <img src="/staez`+ c.filePath + c.changeName +`" alt="">
                                            <div class="concert-day-description-area">
                                                <div class="concert-day-description-place">
                                                    <span>장소</span>
                                                    <span>`+ c.theaterName +`</span>
                                                </div>
                                                <div class="concert-day-description-period">
                                                    <span>공연 기간</span>
                                                    <span>`+ c.startDate +` ~ `+ c.endDate +`</span>
                                                </div>
                                                <div class="concert-day-description-time">
                                                    <span>공연 시간</span>
                                                    <span>`+ c.concertRuntime +`분</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>`
    }
    
    if(concertList.length > 0){
        const pi = result.pi;
        const pageArea = document.querySelector(".page-list");
        
        pageArea.innerHTML = ``
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
        console.log("요기 : "+concertList)
        clickPage[pi.currentPage - 1].classList.add("current")
    } else {
        const pageArea = document.querySelector(".page-list");
        pageArea.innerHTML = ``;
    }
}

function clickpageConcert(_this){

    console.log(_this)
    const concertDate = document.querySelector('.concert-day').querySelector('span').innerHTML;
    const categoryNo  = document.querySelector('.cbs').id;
    const cPage = _this.querySelector("h4").innerHTML;

    pageConcert({
        categoryNo  ,
        concertDate ,
        cPage 
    },(result) => drawDateCategoryConcert(result))

}

function pageArrowConcert(cPage){
    console.log("cPage : " + cPage)
    const concertDate = document.querySelector('.concert-day').querySelector('span').innerHTML;
    const categoryNo  = document.querySelector('.cbs').id;
    pageConcert({
        categoryNo  ,
        concertDate ,
        cPage 
    },(result) => drawDateCategoryConcert(result))
}

function clickDate(_this){
    var liList = document.querySelectorAll(".dates li")
    for(let i = 0; i < liList.length; i++){
        liList[i].classList.remove("clickDate")
        liList[i].classList.remove("clicked")
    }
    _this.classList.add("clickDate");
    _this.classList.add("clicked");

    // let year = date.getFullYear();
    let day = _this.textContent; // 클릭된 날짜의 텍스트 콘텐츠
    // let month = date.getMonth();
    spanDayChange2(year, month, day);
}

const clickedDate = document.querySelector(".concert-day span");
let date = new Date();
let month = date.getMonth();
let year = date.getFullYear();
const months = [
    "01", "02", "03", "04", "05", "06",
        "07", "08", "09", "10", "11", "12"
];
function spanDayChange2(y, m, d){
    console.log(clickedDate);

    clickedDate.parentElement.classList.remove('hidden')
    clickedDate.innerHTML = ``; 
    clickedDate.innerHTML += `${y}-${months[m]}-${String(d).padStart(2, '0')}`; 
    
    
    const concertDate = document.querySelector('.concert-day').querySelector('span').innerHTML;
    const categoryNo  = document.querySelector('.cbs').id;
    const cPage = 1;
    console.log(concertDate)
    console.log(categoryNo)
    clickDateConcert({
        categoryNo  ,
        concertDate ,
        cPage
    },(result) => drawDateCategoryConcert(result))

}

function spanDayChange3(y, m){
    
  
    
    clickedDate.innerHTML = ``; 
    clickedDate.parentElement.classList.add('hidden')
    // clickedDate.innerHTML += `${y}년 ${months[m]}월`; 
    
}

const navs = document.querySelectorAll("#previous, #next");

navs.forEach(nav => {
    nav.addEventListener('click', e => {
        const btnId = e.target.id;

        if (btnId === 'previous' && month === 0) {
            year--;
            month = 11;
        } else if (btnId === 'next' && month === 11) {
            year++;
            month = 0;
        } else {
            month = btnId === "next" ? month + 1 : month - 1;
        }
        
    
        date = new Date(year, month, new Date().getDate());
        spanDayChange3(year, month);
        
    });
});

