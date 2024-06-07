
const closingTime = document.querySelector(".deposit-closing-time");
closingTime.innerHTML = nowPlusOneHour();

function nowPlusOneHour(){
    const now = new Date();

    const year = now.getFullYear();          
    const month = now.getMonth() + 1;        
    const day = now.getDate() + 1;            
    const hours = now.getHours();         
    const minutes = now.getMinutes();

    const paddedMonth = String(month).padStart(2, '0');
    const paddedDay = String(day).padStart(2, '0');
    const paddedHours = String(hours).padStart(2, '0');
    const paddedMinutes = String(minutes).padStart(2, '0');

    return `${year}-${paddedMonth}-${paddedDay} ${paddedHours}:${paddedMinutes}`;
    
}



function insertReserve(){
    const seatList = [];

    document.querySelectorAll(".my-seat-info-span").forEach(function(ev){
        const seatInfo = ev.innerHTML

        // (S석)을 제거
        const cleanedSeatInfo = seatInfo.replace(/\(.*\)/, '').trim();

        // 알파벳과 숫자를 분리
        const [seatRow, seatNumber] = cleanedSeatInfo.split('-');

        const row = decimalToBase26(seatRow);
        const seatInformation = row + `-` + seatNumber;
        seatList.push({
            seat : seatInformation
        })
    })

    document.querySelector("input[name = 'seatList']").value = JSON.stringify(seatList);  

    const reserveDateTime = document.querySelector(".my-reserve-time-value").innerHTML;

    const [concertDate, schedule] = reserveDateTime.split(" ");
    
    document.querySelector("input[name = 'concertDate']").value = concertDate;
    document.querySelector("input[name = 'schedule']").value = schedule;


    ev.submit();
}

function decimalToBase26(num) {
    let result = 0;
    for (let i = 0; i < num.length; i++) {
        let charValue = num.charCodeAt(i) - 65;
        result = result * 26 + charValue + 1;
    }
    return result;  // 1을 더한 것을 상쇄
}