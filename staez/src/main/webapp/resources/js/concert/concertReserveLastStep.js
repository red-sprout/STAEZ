
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

    document.querySelectorAll(".my-seat-info-span").forEach(function(infoSpen){
        const seatInfo = infoSpen.innerHTML

        // (S석)을 제거
        const cleanedSeatInfo = seatInfo.replace(/\(.*\)/, '').trim();

        // 알파벳과 숫자를 분리
        const [seatRow, seatNumber] = cleanedSeatInfo.split('-');

        const row = decimalToBase26(seatRow);
        const seatInformation = row + `-` + seatNumber;
        console.log(seatInformation)
        seatList.push(
            seatInformation
        )
    })

    document.querySelector("input[name = 'seatList']").value = JSON.stringify(seatList);  
    
    const reserveDateTime = document.querySelector(".my-reserve-time-value").innerHTML;

    const [concertDateText, scheduleText] = reserveDateTime.split(" ");
    
    const payMethodText = document.querySelector(".pay-method-span").innerHTML;

    document.querySelector("input[name = 'payMethod']").value = payMethodText;
    
    document.querySelector("input[name = 'concertDate']").value = concertDateText;
    document.querySelector("input[name = 'schedule']").value = scheduleText;
    

    const userNo = document.querySelector("input[name = 'userNo']").value;
    const concertNo = document.querySelector("input[name = 'concertNo']").value;
    const recipientName = document.querySelector("input[name = 'recipientName']").value;
    const recipientPhone = document.querySelector("input[name = 'recipientPhone']").value;
    const recipientBirth = document.querySelector("input[name = 'recipientBirth']").value;
    const recipientEmail = document.querySelector("input[name = 'recipientEmail']").value;
    const payMethod = document.querySelector("input[name = 'payMethod']").value;
    const concertDate =  document.querySelector("input[name = 'concertDate']").value;
    const schedule = document.querySelector("input[name = 'schedule']").value;
    const totalAmount = document.querySelector("input[name = 'totalAmount']").value;
    const rids = JSON.stringify({
        userNo,
        concertNo,
        recipientName,
        recipientPhone,
        recipientBirth,
        recipientEmail,
        payMethod,
        concertDate,
        schedule,
        seatList,
        totalAmount
    })


    ajaxinsertReserve({rids},(res) => alertAndClose(res))
   
}   
    
function decimalToBase26(num) {
    let result = 0;
    for (let i = 0; i < num.length; i++) {
        let charValue = num.charCodeAt(i) - 65;
        result = result * 26 + charValue + 1;
        }
        return result;  // 1을 더한 것을 상쇄
}
        
function alertAndClose(res){
    console.log(res)
    if(res === "good"){
        alert("예매에 성공하셨습니다. 무통장 입금의 입금계좌는 예매하기 완료 후 결제내역에서 확인!")
        window.close();
    } else {    
        alert("예매를 실패하였습니다.")
        window.close();
    }
}

function payMethodChange(_this){
    const checkBoxs = document.querySelectorAll(".check-box");

    for(let c of checkBoxs){
        c.classList.remove("checked")
    }

     _this.querySelector(".check-box").classList.add("checked");
    
    const payMethod = _this.querySelector(".pay-method").innerHTML;

    document.querySelector(".pay-method-span").innerHTML = payMethod;

    let className = '';
    
    if(payMethod === "무통장입금"){
        className = '.no-bankbook'
    } else if(payMethod === "카카오페이"){
       className = '.kakaopay'
    }
    const nextBtns = document.querySelectorAll(".next-step-area");

    for(let n of nextBtns){
        n.classList.add("hidden")
    }

    let nextBtn = document.querySelector(className);

    nextBtn.classList.remove("hidden")   
}

function kakaoPay(){
    const concertTitle = document.querySelector("input[name = 'concertTitle']").value;
    const totalAmount = document.querySelector("input[name = 'totalAmount']").value;

    const seatList = [];

    document.querySelectorAll(".my-seat-info-span").forEach(function(infoSpen){
        const seatInfo = infoSpen.innerHTML

        // (S석)을 제거
        const cleanedSeatInfo = seatInfo.replace(/\(.*\)/, '').trim();

        // 알파벳과 숫자를 분리
        const [seatRow, seatNumber] = cleanedSeatInfo.split('-');

        const row = decimalToBase26(seatRow);
        const seatInformation = row + `-` + seatNumber;
        console.log(seatInformation)
        seatList.push(
            seatInformation
        )
    })

    document.querySelector("input[name = 'seatList']").value = JSON.stringify(seatList);  

    const reserveDateTime = document.querySelector(".my-reserve-time-value").innerHTML;

    const [concertDateText, scheduleText] = reserveDateTime.split(" ");
    
    const payMethodText = document.querySelector(".pay-method-span").innerHTML;

    document.querySelector("input[name = 'payMethod']").value = payMethodText;
    
    document.querySelector("input[name = 'concertDate']").value = concertDateText;
    document.querySelector("input[name = 'schedule']").value = scheduleText;
    

    const userNo = document.querySelector("input[name = 'userNo']").value;
    const concertNo = document.querySelector("input[name = 'concertNo']").value;
    const recipientName = document.querySelector("input[name = 'recipientName']").value;
    const recipientPhone = document.querySelector("input[name = 'recipientPhone']").value;
    const recipientBirth = document.querySelector("input[name = 'recipientBirth']").value;
    const recipientEmail = document.querySelector("input[name = 'recipientEmail']").value;
    const payMethod = document.querySelector("input[name = 'payMethod']").value;
    const concertDate =  document.querySelector("input[name = 'concertDate']").value;
    const schedule = document.querySelector("input[name = 'schedule']").value;
    
    const rids = JSON.stringify({
        userNo,
        concertNo,
        recipientName,
        recipientPhone,
        recipientBirth,
        recipientEmail,
        payMethod,
        concertDate,
        schedule,
        seatList,
        totalAmount
    })
    ajaxKakaoPay({
        rids,
        concertTitle,
        totalAmount
    },(res)=>kakaoPayResult(res))

}

function kakaoPayResult(res){
    console.log(res)
    location.href=res.next_redirect_pc_url
}





