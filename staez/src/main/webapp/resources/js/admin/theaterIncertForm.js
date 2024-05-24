function updateRow(_this) {
    const colNum = document.querySelector(".seat-ui thead>tr").children.length;
    const tbody = document.querySelector(".seat-ui tbody");
    tbody.innerHTML = ``;
    for(let i = 0; i < _this.value; i++) {
        const tr = document.createElement("tr");
        const input = decimalToBase26(i);
        for(let j = 0; j < colNum; j++) {
            const th = document.createElement("th");
            if(j === 0) {
                th.innerHTML = `${input}`;
                tr.appendChild(th);
                continue;
            }
            th.setAttribute("class", "seat-yes");
            th.setAttribute("id",  (i + 1) + "-" + (j + 1));
            th.innerHTML = `&nbsp`;
            th.addEventListener("click", (ev) => toggleSeat(ev.target));
            tr.appendChild(th);
        }
        tbody.appendChild(tr);
    }
}

function updateCol(_this) {
    const tbody = document.querySelector(".seat-ui tbody");
    const thead = document.querySelector(".seat-ui thead");
    const rowNum = tbody.children.length;

    thead.innerHTML = '';
    const tr = document.createElement("tr");
    tr.innerHTML += `<th></th>`;
    thead.appendChild(tr);

    for(let i = 0; i < rowNum; i++) {
        while(tbody.children[i].children.length > 1) {
            tbody.children[i].removeChild(tbody.children[i].lastElementChild);
        }
    }

    for(let i = 0; i < _this.value; i++) {
        const th = document.createElement("th");
        th.innerHTML = i + 1;
        tr.appendChild(th);
    }

    for(let i = 0; i < rowNum; i++) {
        for(let j = 0; j < _this.value; j++) {
            const th = document.createElement("th");
            th.setAttribute("class", "seat-yes");
            th.setAttribute("id",  (i + 1) + "-" + (j + 1));
            th.innerHTML = `&nbsp`;
            th.addEventListener("click", (ev) => toggleSeat(ev.target));
            tbody.children[i].appendChild(th);
        }
    }
}

function toggleSeat(target) {
    const id = target.getAttribute("id");
    const rc = id.split('-');

    let status = 'Y';
    if(target.getAttribute("class") === "seat-yes") {
        status = 'Y';
    } else {
        status = 'N';
    }

    const data = {
        "impossibleSeatRow" : rc[0],
        "impossibleSeatCol" : rc[1],
        status
    }

    ajaxToggleSeat(data, (res) => console.log(res));
    target.classList.toggle("seat-yes");
    target.classList.toggle("seat-no");
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