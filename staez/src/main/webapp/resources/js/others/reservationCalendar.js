document.addEventListener('DOMContentLoaded', () => {
    const tophtml = document.querySelector(".calendar-top h3");
    const dates = document.querySelector(".dates");
    const navs = document.querySelectorAll("#previous, #next");
    const userInfo = document.querySelector("input[name = 'userNo']");

    const months = [
        "01", "02", "03", "04", "05", "06",
        "07", "08", "09", "10", "11", "12"
    ];

    
    let date = new Date();
    let month = date.getMonth();
    let year = date.getFullYear();
    
    const clickedDate = document.querySelector(".reservation-day span");
    
    
    function spanDayChange(d){
        
        clickedDate.innerHTML = ``; 
        clickedDate.innerHTML = `${year}-${months[month]}-${String(d).padStart(2, '0')}일`;
    }

    
    spanDayChange(date.getDate());
    
    // function renderCalendar(reserveDate) {
        
    //     function getConcertDates(reserveDates) {
    //         return reserveDates.map(reservation => reservation.concertDate);
    //     }
        
    //     const concertDates = getConcertDates(reserveDate)

    //     function parseKoreanDate(concertDates) {
    //         const [monthDay, year] = concertDates.split(", ");
    //         const [month, day] = monthDay.split("월 ");
    //         return [parseInt(year), parseInt(month), parseInt(day)];
    //     }

    //     const parseDates = concertDates.map(parseKoreanDate);
        
    //     console.log(parseDates)
    //     const startDay = new Date(year, month, 1).getDay(); // 월의 시작 요일
        
    //     const endDate = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날짜
        
    //     // const endDay = new Date(year, month, endDate).getDay(); // 월의 마지막 요일
        
    //     const endDatePrev = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날짜
        
    //     let datesHtml = '';
        
    //     // 이전 달의 날짜들
    //     for (let i = startDay; i > 0; i--) {
    //         datesHtml += `<li class="inactive">${endDatePrev - i + 1}</li>`;
    //     }
        
    //     recalendar();
    //     // 현재 달의 날짜들
    //     function recalendar(){
    //         for (let i = 1; i <= endDate; i++) {
    //             let className;
    //             if(i === 12 || i === 22 || i === 23 || i === 25 || i === 20){
    //                 if( i === date.getDate() &&
    //                 month === new Date().getMonth() &&
    //                 year === new Date().getFullYear()){
    //                     className ='class="today clickDate clicked "';
    //                     datesHtml += `<li ${className} onclick="clickDate(this)">${i}</li>`;
    //                 }
    //                 className = 'class="reservation"';
    //                 datesHtml += `<li ${className} onclick="clickDate(this)">${i}</li>`;
    //             } else {
    //                 className =
    //                 '';
    //                 datesHtml += `<li ${className} onclick="clickDate(this)">${i}</li>`;
    //             }
    //         }
    //     }
        
    //     // 다음 달의 날짜들
    //     const totalDays = startDay + endDate;
    //     const nextDays = (totalDays % 7 === 0) ? 0 : 7 - (totalDays % 7);
    //     for (let i = 1; i <= nextDays; i++) {
    //         datesHtml += `<li class="inactive">${i}</li>`;
    //     }
        
    //     dates.innerHTML = datesHtml;
    //     tophtml.textContent = `${year}년 ${months[month]}`;
    // }reserveConcertList

    function renderCalendar(reserveDate) {
        
        function getConcertDates(reserveDates) {
            return reserveDates.map(reservation => reservation.concertDate);
        }
        
        const concertDates = getConcertDates(reserveDate);
        console.log(concertDates);
    
        function parseKoreanDate(concertDates) {
            const [monthDay, year] = concertDates.split(", ");
            const [month, day] = monthDay.split("월 ");
            return [parseInt(year), parseInt(month), parseInt(day)];
        }
    
        const parseDates = concertDates.map(parseKoreanDate);

        console.log(parseDates);
        const startDay = new Date(year, month, 1).getDay(); // 월의 시작 요일
        
        const endDate = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날짜
        
        // const endDay = new Date(year, month, endDate).getDay(); // 월의 마지막 요일
        
        const endDatePrev = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날짜
        
        let datesHtml = '';
        
        // 이전 달의 날짜들
        for (let i = startDay; i > 0; i--) {
            datesHtml += `<li class="inactive">${endDatePrev - i + 1}</li>`;
        }
        const daysInMonthString = parseDates.map(date => date[2]).join(", ");

        // 현재 달의 날짜들
        for (let i = 1; i <= endDate; i++) {
            let className = '';
            const currentDate = new Date(year, month, i);
            
        
            const isReservedDate = parseDates.some(date => {
                return date[0] === year && date[1] === month + 1 && date[2] === i;
            });
            
            if (isReservedDate) {
                className = 'class="reservation"';
            } else if (i === date.getDate() && month === new Date().getMonth() && year === new Date().getFullYear()) {
                className = 'class="today clickDate clicked "';
            }
            
            datesHtml += `<li ${className} onclick="clickDate(this, '${daysInMonthString}')">${i}</li>`;
        }
        
        // 다음 달의 날짜들
        const totalDays = startDay + endDate;
        const nextDays = (totalDays % 7 === 0) ? 0 : 7 - (totalDays % 7);
        for (let i = 1; i <= nextDays; i++) {
            datesHtml += `<li class="inactive">${i}</li>`;
        }
        
        dates.innerHTML = datesHtml;
        tophtml.textContent = `${year}년 ${months[month]}`;
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
            
            
            date = new Date(year, month, new Date().getDate());
            
          
            const userNo = userInfo.value;
            console.log(userNo)
            reserveConcertList({
                userNo
            },(reserveDate) => renderCalendar(reserveDate))
        });
    });
    
    
    console.log(userInfo)
    const userNo = userInfo.value;
    console.log(userNo)
    reserveConcertList({
        userNo
    },(reserveDate) => renderCalendar(reserveDate))
    
    
});

// function clickDate(_this){
    //     var liList = document.querySelectorAll(".dates li")
    //     for(let i = 0; i < liList.length; i++){
        //         if(liList[i].classList.contains('inactive')){

//         } else if(liList[i].classList.contains('reservation')){
//             _this.classList.add("clickDate");
//             _this.classList.add("clicked");
//             _this.classList.remove("reservation")
//         } else{
//             liList[i].classList.remove("clickDate")
//             liList[i].classList.remove("clicked")
//         }
//         // recalendar();
//     }
//     // _this.classList.add("clickDate");
//     // _this.classList.add("clicked");
    
    
// }


function clickDate(_this, daysInMonth) {  
    var liList = document.querySelectorAll(".dates li");
    var specialDates = daysInMonth;
  
    console.log(daysInMonth)
    for (let i = 0; i < liList.length; i++) {

        if (liList[i] !== _this) {
            if (liList[i].classList.contains('clickDate') || liList[i].classList.contains('clicked')) {            
                if (specialDates.includes(liList[i].textContent)) {
                    liList[i].classList.remove("clickDate");
                    liList[i].classList.remove("clicked");
                    liList[i].classList.add("reservation");
                } else {
                    liList[i].classList.remove("clickDate");
                    liList[i].classList.remove("clicked");
                }
            }
        }
    }
    _this.classList.add("clickDate");
    _this.classList.add("clicked");
    _this.classList.remove("reservation");
    
   
    let year = date.getFullYear();
    let day = _this.textContent; // 클릭된 날짜의 텍스트 콘텐츠
    let month = date.getMonth();
    spanDayChange2(year, month, day);
    
}

const clickedDate = document.querySelector(".reservation-day-span");
let date = new Date();
let month = date.getMonth();
let year = date.getFullYear();
const months = [
    "01", "02", "03", "04", "05", "06",
        "07", "08", "09", "10", "11", "12"
];
function spanDayChange2(y, m, d){
    console.log(clickedDate);

    
    clickedDate.innerHTML = ``; 
    clickedDate.innerHTML += `${y}-${months[m]}-${String(d).padStart(2, '0')}`; 

    const userInfo = document.querySelector("input[name = 'userNo']");
    const userNo = userInfo.value;
    console.log(userNo)
    const date = document.querySelector(".reservation-day-span").innerHTML;
    console.log(date)
    reserveChoiceConcertList({
        userNo,
        date
    },(rConcertList) => drawDateCategoryConcert(rConcertList))
}
function drawDateCategoryConcert(result){
    const concertArea = document.querySelector(".reservation-day-info-area");
    const concertList = result.concertList;
    

    concertArea.innerHTML = ``;
    if(concertList.length === 0){
        concertArea.innerHTML += `<span style="width: 100%;margin-top: 100px;font-size: 30px;">예매하신 공연이 없습니다</span>`
    }
    for(let c of concertList){
        concertArea.innerHTML += `<div class="concert-day-info">
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

}

function spanDayChange3(y, m){
    console.log(clickedDate);

    
    clickedDate.innerHTML = ``; 
    clickedDate.innerHTML += `${y}년 ${months[m]}`; 
    
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

