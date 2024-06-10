window.onload = function(){
    const reserveDate = document.querySelector(".reserve-date").innerHTML;
    const [choiceDate, schedule] = reserveDate.split(' ');
   


    const cNo = document.querySelector("input[name = 'cNo']").value;
    const tNo = document.querySelector("input[name='theaterNo']").value
    ajaxChoiceScheduleSeat({
        cNo,
        tNo,
        choiceDate,
        schedule
    },(resMap)=>drawSeatRatingInfo(resMap));

    const theaterName = document.querySelector("input[name = 'theaterName']").value;
    ajaxTheaterSeatInfo({
        theaterName
    },(theater)=>drawSeatInfo(theater))
}

function drawSeatRatingInfo(resMap){
    const totalSeat = resMap.totalSeat;
    const reserveSeat = resMap.reserveSeat;
    const impossibleSeat = resMap.impossibleSeat;

    const gradeColor = [
        "#640D6B", "#42FF00", "#1400FF", "#ffaa00", "#ff0000",
        "#ffc0cb", "#008000", "#4e1a1a", "#87ceeb", "#966d99"
    ]

    let toSeat = residualSeats(totalSeat, reserveSeat);
    toSeat = residualSeats(toSeat, impossibleSeat);
    const seatRatingArea = document.querySelector(".remaining-rating-info");
    seatRatingArea.innerHTML = ``;

    for(let i = 0; i < toSeat.length; i++){
        let price = formatNumberCommas(toSeat[i].price)
        seatRatingArea.innerHTML += `<div class="rating-area">
                                        <div class="rating-color" style="background: `+ gradeColor[i] +`;"></div>
                                        <span class="rating-name">`+ toSeat[i].grade +`석</span>
                                        <img class="divide" src="/staez/resources/img/concert/divide.png" alt="">
                                        <span class="seat-count">`+ toSeat[i].seatCount +`석</span>
                                        <span class="seat-rating-mount">`+ price +`원</span>
                                    </div>`;
                 
    }
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

function formatNumberCommas(number) {
    return number.toLocaleString('en-US');
}

function drawSeatInfo(theater){
    console.log(theater)

    const theadTr = document.querySelector(".thead-tr");
    theadTr.innerHTML = `<th></th>`

    // 테이블 맨 위
    for(let i = 1; i <= theater.theaterCol; i++){
        theadTr.innerHTML += `<th>`+i+`</th>`;
    }

    const tbody = document.querySelector(".tbody");
    tbody.innerHTML =``;
    for(let i = 1; i <= theater.theaterRow; i++){
        const english = decimalToBase26(i-1);
        tbody.innerHTML +=`<tr class="tbody-tr"><th>`+ english +`</th></tr>`;
    }

    const tbodyTr = document.querySelectorAll(".tbody-tr");

    for(let i = 0; i < tbodyTr.length; i++){
        for(let j = 1; j <= theater.theaterCol; j++){
            tbodyTr[i].innerHTML += `<th class="seat-yes" id="`+(i+1)+`-`+j+`">&nbsp;</th>`;
        }
    }

    const tNo = theater.theaterNo;

    ajaxImpossibleSeatInfo({tNo},(seatInfos)=>drawImpossibleSeat(seatInfos))
}

function decimalToBase26(num) {
    if (num === 0) return 'A';  // 특별한 경우 0은 'A'

    let result = '';
    while (num >= 0) {
        let remainder = num % 26;
        result = String.fromCharCode(remainder + 65) + result;
        num = Math.floor(num / 26) - 1;  // 다음 자릿수 계산
        if (num < 0) break;
    }

    return result;
}

function drawImpossibleSeat(seatInfos){
    
    for(let s of seatInfos){
        let th = document.getElementById(s.impossibleSeatRow +`-`+ s.impossibleSeatCol)
        th.classList.remove("seat-yes")
        th.classList.add("seat-no")
        th.innerHTML =`X`
    }


    const reserveDate = document.querySelector(".reserve-date").innerHTML;
    const [choiceDate, schedule] = reserveDate.split(' ');
    const cNo = document.querySelector("input[name = 'cNo']").value;

    ajaxReserveSeatInfo({
        cNo,
        choiceDate,
        schedule
    },(reSeatInfos)=> drawReserveSeat(reSeatInfos, cNo, choiceDate))
}

function drawReserveSeat(reSeatInfos, cNo, choiceDate){

    for(let rs of reSeatInfos){
        let th = document.getElementById(rs.reserveRow +`-`+ rs.reserveCol)
        th.classList.remove("seat-yes")
        th.classList.add("seat-no")
        th.innerHTML =`X`
    }

    ajaxGradeSeatInfo({
        cNo,
        choiceDate
    },(grSeatInfos) => drawGradeSeatInfo(grSeatInfos))
}

function drawGradeSeatInfo(grSeatInfos){
    console.log(grSeatInfos)
    const gradeColor = [
        "#640D6B", "#42FF00", "#1400FF", "#ffaa00", "#ff0000",
        "#ffc0cb", "#008000", "#4e1a1a", "#87ceeb", "#966d99"
    ]
    let sum = 0;
    for(let i = 0; i < grSeatInfos.length; i++){
        sum += Number(grSeatInfos[i].seatCount);
    }
    
    const thead = document.querySelector(".thead-tr");
    const totalCol = thead.querySelectorAll("th");
    const tBody = document.querySelector(".tbody");
    const totalRow = tBody.querySelectorAll("tr");


    console.log(grSeatInfos[0].seatStartRow)
    console.log(grSeatInfos[0].seatEndRow)
    for(let i = 0; i < grSeatInfos.length; i++){
        for(let j = 1; j < totalCol.length; j++){
            for(let k = 1; k <= totalRow.length; k++){
                let thIdArea = document.getElementById( k +`-`+ j ); 
                let thId = thIdArea.id;
                let [row, col] = thId.split('-');
                if(Number(grSeatInfos[i].seatStartCol) <= col && col <= Number(grSeatInfos[i].seatEndCol)
                    && Number(grSeatInfos[i].seatStartRow) <= row && row <= Number(grSeatInfos[i].seatEndRow)
                    && thIdArea.classList.contains("seat-yes")){
                    thIdArea.classList.add(grSeatInfos[i].grade)
                    thIdArea.style = "background:" + gradeColor[i] + ";"
                }
            }
        }
    }

    seatClickEv(grSeatInfos);
}

function seatClickEv(grSeatInfos){
    const seat = document.querySelectorAll(".seat-yes");

    for(let s of seat){
        s.addEventListener('click', e => {
            const remainingSeat = document.querySelector(".remaining-seat-info")
            const classList = e.target.classList;
            const grade = Array.from(classList).find(cls => cls.length === 1);
            let amount = document.getElementById("amount")
            const totalAmount = document.querySelector("input[name = 'totalAmount']")

            let gprice = 0;
            for(let i = 0; i < grSeatInfos.length; i++){
                if(grade === grSeatInfos[i].grade){
                    gprice = grSeatInfos[i].price;
                }
            }
            const seatNo = e.target.id;
            const seatRating = grade;
            
            let [rowNum, col] = seatNo.split('-');
            let row = decimalToBase26(rowNum-1);
            if(e.target.classList.contains("seat-click")){
                e.target.classList.remove("seat-click")
                const removeInfos = document.getElementById(seatNo+seatRating)
                removeInfos.remove();
                amount.innerHTML = (Number(amount.innerHTML) - Number(gprice))
                totalAmount.value = amount.innerHTML
                console.log(totalAmount.value)
                if(amount.innerHTML.length === 1){
                    document.querySelector(".next-btn-form").classList.add("hidden");
                } 
            } else {
                e.target.classList.add("seat-click")
                remainingSeat.innerHTML += `<div class="seat-info" id="`+seatNo+seatRating +`">
                                                <span class="info-span">`+ row + `-` + col +`(`+ seatRating +`석)</span>
                                                <span>`+ gprice +`원</span>
                                            </div>`
                amount.innerHTML = (Number(amount.innerHTML) + Number(gprice))
                totalAmount.value = amount.innerHTML
                console.log(totalAmount.value)
               
                document.querySelector(".next-btn-form").classList.remove("hidden");
        
            }
        })


    }
}

document.querySelector("#next-btn").addEventListener("click", function(){
    const seatList = [];

    document.querySelectorAll(".info-span").forEach(function(ev){
        const seatInfo = ev.innerHTML;

        seatList.push({
            seat : seatInfo
        })
    })


    document.querySelector("input[name = 'seatList']").value = JSON.stringify(seatList);  
    
    document.querySelector("#next-btn").submit();

})
