$(function() {
    summernote();
    category({refCategoryNo: 1}, (res) => (setCategory(res, 'concert-category')));
});

function addConcertSchedule() {
    const condition = document.getElementById("additional-schedule");
    const div = document.createElement("div");
    div.setAttribute("class", "condition");
    div.innerHTML += `  
                        <h3>&nbsp;</h3>
                        <div class="range-form">
                            <input type="text" name="startDate" class="short-input" placeholder="시작일">
                            <span><h3>~</h3></span>
                            <input type="text" name="endDate" class="short-input" placeholder="종료일">
                        </div>
                        <input type="text" name="schedule" class="time-input" placeholder="(예시)12:00-14:00">
                        <button class="btn-staez" type="button" onclick="noConcertSchedule(this)"><h4>공연 없음</h4></button>
                        <button class="btn-staez" type="button" onclick="deleteConcertSchedule(this)"><h4>삭제</h4></button>
                    `;
    condition.appendChild(div);
}

function deleteConcertSchedule(_this) {
    const condition = document.getElementById("additional-schedule");
    condition.removeChild(_this.parentElement);
}

function noConcertSchedule(_this) {
    const parent = _this.parentElement;
    const time = parent.children[2];
    if(!_this.getAttribute("class").includes("checked")) {
        time.value = "N";
        time.setAttribute("readOnly", true);
    } else {
        time.value = "";
        time.setAttribute("placeholder", "(예시)12:00-14:00");
        time.removeAttribute("readOnly");
    }
    _this.classList.toggle("checked");
}

function addGrade(_this) {
    const wrapper = document.getElementById("additional-grade");
    const div = document.createElement("div");

    const row = document.createElement("div");
    const col = document.createElement("div");

    row.setAttribute("class", "grade-row");
    col.setAttribute("class", "grade-col");
    addGradeElement(row, "seatStartRow", "좌석 첫 행", "seatEndRow", "좌석 끝 행");
    addGradeElement(col, "seatStartCol", "좌석 첫 열", "seatEndCol", "좌석 끝 열");

    const grade = document.createElement("input");
    const price = document.createElement("input");
    const del = document.createElement("button");

    inputAttribute(grade, "text", "grade", "short-short-input", "(등급)");
    inputAttribute(price, "number", "price", "short-short-input", "(가격, 원)");

    del.setAttribute("class", "btn-staez");
    del.setAttribute("type", "button");
    del.addEventListener("click", (ev) => deleteGrade(ev.target.parentElement));
    del.innerHTML += `<h4>삭제</h4>`

    col.appendChild(grade);
    col.appendChild(price);
    col.appendChild(del);

    div.appendChild(row);
    div.appendChild(col);

    wrapper.appendChild(div);
}

function addGradeElement(ele, start, startMsg, end, endMsg) {
    const h3 = document.createElement("h3");
    const div = document.createElement("div")

    h3.innerHTML = "&nbsp;";
    div.setAttribute("class", "range-form");

    const startInput = document.createElement("input");
    const middle = document.createElement("span");
    const endInput = document.createElement("input");

    inputAttribute(startInput, "number", start, "short-input", startMsg);
    inputAttribute(endInput, "number", end, "short-input", endMsg);

    middle.innerHTML += `<h3>~</h3>`;

    div.appendChild(startInput);
    div.appendChild(middle);
    div.appendChild(endInput);

    ele.appendChild(h3);
    ele.appendChild(div);
}

function inputAttribute(ele, type, name, className, msg) {
    ele.setAttribute("type", type);
    ele.setAttribute("name", name);
    ele.setAttribute("class", className);
    ele.setAttribute("placeholder", msg);
}

function deleteGrade(_this) {
    const grade = document.getElementById("additional-grade");
    console.log(_this.parentElement);
    grade.removeChild(_this.parentElement);
}