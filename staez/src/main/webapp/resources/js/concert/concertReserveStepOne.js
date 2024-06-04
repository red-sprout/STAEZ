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

    

    function renderCalendar(concertPeriod) {
        const startDay = new Date(year, month, 1).getDay(); // 월의 시작 요일
        
        const endDate = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날짜
        
        const endDay = new Date(year, month, endDate).getDay(); // 월의 마지막 요일
          
        const endDatePrev = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날짜
         
        

        let datesHtml = '';

        // 이전 달의 날짜들
        for (let i = startDay; i > 0; i--) {
            datesHtml += `<li class="inactive">${endDatePrev - i + 1}</li>`;
        }

        recalendar();
        // 현재 달의 날짜들
        function recalendar(){
            const conStartDate = new Date(concertPeriod.startDate);
            const conEndDate = new Date(concertPeriod.endDate);
            conStartDate.setHours(0, 0, 0, 0);
            conEndDate.setHours(0, 0, 0, 0);
            
            for (let i = 1; i <= endDate; i++) {
                let className;
                const currentDate = new Date(year, month, i);
                currentDate.setHours(0, 0, 0, 0);
                if(currentDate >= conStartDate && currentDate <= conEndDate){
                        className ='class="textColor"';
                    datesHtml += `<li ${className} onclick="clickDate(this)">${i}</li>`;
                } else {
                    className =
                        'class="inactive"';
                    datesHtml += `<li ${className}">${i}</li>`;
                    }
            }
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
            
            ajaxConcertPeriod({concertNo},(concertPeriod)=>renderCalendar(concertPeriod));
        });
    });


    ajaxConcertPeriod({concertNo},(concertPeriod)=>renderCalendar(concertPeriod));

    
});

function clickDate(_this) {  
    var liList = document.querySelectorAll(".dates li");
    var specialDates = ['12', '22', '23', '25', '20'];

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
    clickedDate.innerHTML += `${y}-${months[m]}-${String(d).padStart(2, '0')}`; 
    
}

function spanDayChange3(y, m){
    console.log(clickedDate);

    
    clickedDate.innerHTML = ``; 
    clickedDate.classList.add("bd")
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


// function drawConcertInfo(concert){
//     console.log(concert)
// }


