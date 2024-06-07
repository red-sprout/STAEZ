document.addEventListener('DOMContentLoaded', () => {
    const tophtml = document.querySelector(".calendar-top h3");
    const dates = document.querySelector(".dates");
    const navs = document.querySelectorAll("#previous, #next");
    const concertNo = document.querySelector("input[name = 'concertNo']").value;

   

    const months = [
        "01", "02", "03", "04", "05", "06",
        "07", "08", "09", "10", "11", "12"
    ];

    let date = new Date();
    let month = date.getMonth();
    let year = date.getFullYear();
    let day = date.getDate();

    

    function renderCalendar(dayOffs,concertPeriod) {
        const startDay = new Date(year, month, 1).getDay(); // 월의 시작 요일
        
        const endDate = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날짜
        
        const endDay = new Date(year, month, endDate).getDay(); // 월의 마지막 요일
          
        const endDatePrev = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날짜
         
       
        

        let datesHtml = '';

        // 이전 달의 날짜들
        datesHtml = drawBeforeMonthDay(startDay, endDatePrev, datesHtml)
        
        recalendar();
        // 현재 달의 날짜들
        function recalendar(){
            console.log(dayOffs)
            const conStartDate = new Date(concertPeriod.startDate);
            const conEndDate = new Date(concertPeriod.endDate);
            conStartDate.setHours(0, 0, 0, 0);
            conEndDate.setHours(0, 0, 0, 0);
            
            for(let i = 0; i < dayOffs.length; i++){
                dayOffs[i].startDate = new Date(dayOffs[i].startDate)
                dayOffs[i].endDate = new Date(dayOffs[i].endDate)
                dayOffs[i].startDate.setHours(0, 0, 0, 0)
                dayOffs[i].endDate.setHours(0, 0, 0, 0)
            }

        
            datesHtml = drawRecalendar(conStartDate, conEndDate, dayOffs, endDate, datesHtml)
            
        }

        // 다음 달의 날짜들
        const totalDays = startDay + endDate;
        const nextDays = (totalDays % 7 === 0) ? 0 : 7 - (totalDays % 7);
        datesHtml = drawNextMonthDay(nextDays, datesHtml)
      

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
            
        
            date = new Date(year, month, new Date().getDate());
            
            ajaxConcertPeriod({concertNo},(concertPeriod)=>concertDayOffFunction(concertPeriod));
        });
    });
    

    ajaxConcertPeriod({concertNo},(concertPeriod)=>concertDayOffFunction(concertPeriod));
    
    function concertDayOffFunction(concertPeriod){
        ajaxConcertDayOff({concertNo},(dayOffs)=>renderCalendar(dayOffs,concertPeriod))
    }
});

function drawBeforeMonthDay(startDay, endDatePrev, datesHtml){
    for (let i = startDay; i > 0; i--) {
        datesHtml += `<li class="inactive">${endDatePrev - i + 1}</li>`;
    }
    return datesHtml;
}

function drawRecalendar(conStartDate, conEndDate, dayOffs, endDate, datesHtml){
    for (let i = 1; i <= endDate; i++) {
        let className;
        const currentDate = new Date(year, month, i);
        currentDate.setHours(0, 0, 0, 0);
        if(currentDate >= conStartDate && currentDate <= conEndDate){
            let dayOffBoolean = true;
            for(let j = 0; j < dayOffs.length; j++){
                if(currentDate >= dayOffs[j].startDate && currentDate <= dayOffs[j].endDate){
                    className = 'class="inactive"';
                    datesHtml += `<li ${className}">${i}</li>`;
                    dayOffBoolean = false
                    break;
                }
            }
            if(dayOffBoolean){
                className = 'class="textColor"';
                datesHtml += `<li ${className} onclick="clickDate(this)">${i}</li>`;
            }
                    
        } else {
            className = 'class="inactive"';
            datesHtml += `<li ${className}">${i}</li>`;
            }
    }
    return datesHtml;
}

function drawNextMonthDay(nextDays, datesHtml){
    for (let i = 1; i <= nextDays; i++) {
        datesHtml += `<li class="inactive">${i}</li>`;
    }
    return datesHtml; 
}

function clickDate(_this) {  

    var specialDates = document.querySelectorAll(".textColor")

    for (let i = 0; i < specialDates.length; i++) {
        specialDates[i].classList.remove("clickDate");
        specialDates[i].classList.remove("clicked");
    }
    _this.classList.add("clickDate");
    _this.classList.add("clicked")
 
    let year = date.getFullYear();
    let day = _this.textContent; // 클릭된 날짜의 텍스트 콘텐츠
    let month = date.getMonth();
    spanDayChange2(year, month, day);
    
}

const clickedDate = document.querySelector(".choice-date-span");
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
    clickedDate.classList.add("bd")
    const choiceDate = `${y}-${months[m]}-${String(d).padStart(2, '0')}`;
    clickedDate.innerHTML += choiceDate; 
    console.log(choiceDate)
    const concertNo = document.querySelector("input[name = 'concertNo']").value;
    
    ajaxChoiceDateSchedule({
    concertNo,
        choiceDate
    },(schedules) => drawChoiceDateSchedule(concertNo, choiceDate, schedules))
}

function spanDayChange3(y, m){
   
    clickedDate.innerHTML = ``; 
    clickedDate.classList.add("bd")
    clickedDate.innerHTML += `${y}년 ${months[m]}월`; 
    
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
        
    });
});


function drawChoiceDateSchedule(concertNo, choiceDate, schedules){
    
    const scheduleArea = document.querySelector(".schedule-container");
    const roundArea =document.querySelector(".round-area");
    roundArea.classList.remove("hidden")
    scheduleArea.innerHTML=``;
    for(let s of schedules){
        scheduleArea.innerHTML += `<div class="round-time-area" onclick="choiceDateSchedule(this, `+ concertNo +`, '`+ choiceDate +`', '`+ s.schedule +`')">
                                        <span>`+ s.schedule +`</span>
                                    </div>`;
        }
}

function choiceDateSchedule(_this, cNo, choiceDate, schedule){
    const timeArea = document.querySelectorAll(".round-time-area");
    for(let i = 0; i < timeArea.length; i++){
        timeArea[i].classList.remove("choice-time")
    }
    _this.classList.add("choice-time")
    const reserveTimeValue = document.querySelector(".my-reserve-time-value")
    reserveTimeValue.innerHTML = ``;
    reserveTimeValue.innerHTML = choiceDate + ` ` + schedule;
    
    const reserveDate = reserveTimeValue.innerHTML;
    ajaxChoiceScheduleSeat({
        cNo,
        choiceDate,
        schedule
    },(resMap)=>drawSeatRatingInfo(resMap, reserveDate));
}

function drawSeatRatingInfo(resMap, reserveDate){
    const totalSeat = resMap.totalSeat;
    const reserveSeat = resMap.reserveSeat;
    
    const seatRatingInfoTitle = document.querySelector(".remaining-seat-rating-area");
    seatRatingInfoTitle.innerHTML = `<span>좌석등급/잔여석</span>`;

    const gradeColor = [
        "#640D6B", "#42FF00", "#1400FF", "#ffaa00", "#ff0000",
        "#ffc0cb", "#008000", "#4e1a1a", "#87ceeb", "#966d99"
    ]

    const seatRatingInfoArea = document.querySelector(".remaining-seat-rating-info");
    seatRatingInfoArea.classList.remove("hidden");

    const toSeat = residualSeats(totalSeat, reserveSeat);

    seatRatingInfoArea.innerHTML = ``;
    for(let i = 0; i < toSeat.length; i++){
        seatRatingInfoArea.innerHTML += `<div class="rating-area">
                                            <div class="rating-color" style="background: `+ gradeColor[i] +`;"></div>
                                            <span class="rating-name">`+ toSeat[i].grade +`석</span>
                                            <img class="divide" src="/staez/resources/img/concert/divide.png" alt="">
                                            <span class="seat-count">`+ toSeat[i].seatCount +`석</span>
                                        </div>`;
    }

    const nextBtn = document.querySelector(".next-step-container");
    nextBtn.classList.remove("hidden")
    nextBtn.querySelector("input[name = 'reserveDate']").value = reserveDate;
}

function residualSeats(toSeat, reserveSeat){
    for(let i = 0; i < reserveSeat.length; i++){
        for(let j = 0; j < toSeat.length; j++){
            if(reserveSeat[i].grade === (toSeat[j].grade)){
                toSeat[j].seatCount = toSeat[j].seatCount - reserveSeat[i].seatCount;      
            }
        }
    }

    return toSeat;
}


