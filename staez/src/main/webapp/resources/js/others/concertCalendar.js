document.addEventListener('DOMContentLoaded', () => {
    const tophtml = document.querySelector(".calendar-top h3");
    const dates = document.querySelector(".dates");
    const navs = document.querySelectorAll("#previous, #next");

    const months = [
        "1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
    ];

    let date = new Date();
    let month = date.getMonth();
    let year = date.getFullYear();

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
            year = date.getFullYear();
            month = date.getMonth();

            renderCalendar();
        });
    });

    renderCalendar();

    
});

function clickDate(_this){
    var liList = document.querySelectorAll(".dates li")
    for(let i = 0; i < liList.length; i++){
        liList[i].classList.remove("clickDate")
        liList[i].classList.remove("clicked")
    }
    _this.classList.add("clickDate");
    _this.classList.add("clicked");
}