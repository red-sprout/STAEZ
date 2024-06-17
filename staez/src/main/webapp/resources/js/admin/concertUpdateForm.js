$(function() {
    summernote();
    const concertCategoryName = document.querySelector("input[name=categoryName]").value;
    const concertNo = document.querySelector("input[name=concertNo]").value;
    category({refCategoryNo: 1}, (res) => (setConcertCategory(res, 'concert-category', concertCategoryName)));

    $('input').keydown(function (ev) {
        if (ev.keyCode === 13) {
            ev.preventDefault();
        };
    });

    $("#update-submit").on("click", (ev) => {
        let formData = new FormData()

        formData.append("concertNo", concertNo);
        formData.append("schedule", scheduleForm());
        formData.append("seat", gradeForm());
        formData.append("concert", concertForm());

        consertUpdate(formData, res => {
            location.href = contextPath + res;
        });
    })
});


function setConcertCategory(result, id, concertCategoryName) {
    const li = document.querySelector(`#${id}`);
    li.innerHTML = '<h3>장르</h3>'; // 기존 내용을 지우기 위해 초기화합니다.

    for (let ele of result) {
        // 버튼 요소 생성
        let btn = document.createElement('button');
        btn.className = 'btn-staez';
        btn.type = 'button';
        btn.onclick = function () { toggleCategory(this, id); };
        let h4 = document.createElement('h4');
        h4.textContent = ele.categoryName;
        btn.appendChild(h4);

        // 라디오 버튼 요소 생성
        let input = document.createElement('input');
        input.type = 'radio';
        input.name = 'categoryNo';
        input.className = 'hidden';
        input.value = ele.categoryNo;

        // concertCategoryName과 일치하는지 확인하여 클래스 및 체크 상태 설정
        if (ele.categoryName === concertCategoryName) {
            btn.classList.add('checked');
            input.checked = true;
        }

        // 요소 추가
        li.appendChild(btn);
        li.appendChild(input);
    }
}

function addConcertSchedule() {
    const condition = document.getElementById("additional-schedule");
    const div = document.createElement("div");
    div.setAttribute("class", "condition");
    div.innerHTML += `  
                        <h3>&nbsp;</h3>
                        <div class="range-form">
                            <input type="date" name="startDate" class="short-input" placeholder="시작일">
                            <span><h3>~</h3></span>
                            <input type="date" name="endDate" class="short-input" placeholder="종료일">
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
    const concertDate = document.createElement("input");

    row.setAttribute("class", "grade-row");
    col.setAttribute("class", "grade-col");
    addGradeElement(row, "seatStartRow", "좌석 첫 행", "seatEndRow", "좌석 끝 행");
    inputAttribute(concertDate, "date", "concertDate", "short-short-input", "");
    addGradeElement(col, "seatStartCol", "좌석 첫 열", "seatEndCol", "좌석 끝 열");
    row.appendChild(concertDate);

    const grade = document.createElement("input");
    const price = document.createElement("input");
    const del = document.createElement("button");

    inputAttribute(grade, "text", "grade", "short-short-input", "(등급)");
    inputAttribute(price, "number", "price", "short-short-input", "(가격, 원)");

    del.setAttribute("class", "btn-staez");
    del.setAttribute("type", "button");
    del.addEventListener("click", (ev) => deleteGrade(ev.currentTarget.parentElement));
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
    grade.removeChild(_this.parentElement);
}

function searchResult(_this) {
    const keyword = _this.value;
    ajaxSearchTheaterList({ "keyword": keyword }, res => drawResultList(res));
}

function drawResultList(result) {
    const ul = document.querySelector("#theater .search-list");
    ul.innerHTML = "";

    for(let ele of result) {
        const li = document.createElement("li");
        const btn = document.createElement("button");
        const img = document.createElement("img");
        const input = document.createElement("input");
        const span = document.createElement("span");

        btn.setAttribute("type", "button");
        img.setAttribute("src", contextPath + "/resources/img/community/communityMain/search-icon.png");
        input.setAttribute("type", "hidden");
        input.setAttribute("value", ele.theaterNo);
        span.innerHTML = ele.theaterName;

        btn.appendChild(img);
        li.appendChild(btn);
        li.appendChild(input);
        li.appendChild(span);
        ul.appendChild(li);

        li.addEventListener("click", (ev) => {
            const theaterName = document.querySelector("#theater input[name='theaterName']")
            const theaterNo = document.querySelector("#theater input[name='theaterNo']");
            theaterNo.value = ev.currentTarget.children[1].value;
            theaterName.value = ev.currentTarget.children[2].innerHTML;
            ul.innerHTML = "";
        });
    }
}

// 썸머노트에 이미지업로드가 발생하였을 때 동작하는 함수
function fileUpload(fileList) {
    // 썸머노트는 이미지를 추가하면 해당이미지파일을 전달해준다.
    // callback함수를 작성하지 않을경우 자동으로 이미지를 string으로 변환해서 보여주지만
    // customCallback을 작성할 경우 해당 이미지의 경로를 직접 주어야한다.

    // 파일업로드를 할때는 form태그에서 encType을 multipart/form-data형식으로
    // 요청하는 것처럼 자바스크립트 객체에 FormData객체를 이용해서 ajax요청을 해준다.
    const fd = new FormData();
    for (let file of fileList) {
        fd.append("fileList", file);
    }

    insertFileApi(fd, function (nameList) {
        for (let name of nameList) {
            $("#summernote").summernote('insertImage', contextPath + name);
        }
    });
}

function updateFileName(input) {
    const fileNameField = document.getElementById('fileName');
    const filePath = input.value.split('\\').pop();
    fileNameField.value = filePath;
}

// 제출 전 데이터 처리
function scheduleForm() {
    const scheduleList = [];
    const period = document.querySelectorAll("#period input, #additional-schedule input");

    for(let i = 0; i < period.length; i += 3) {
        let schedule = {};

        schedule.startDate = period[i].value;
        schedule.endDate = period[i + 1].value;
        schedule.schedule = period[i + 2].value;

        scheduleList.push(schedule);
    }

    return JSON.stringify(scheduleList);
}

function gradeForm() {
    const seatList = [];
    const grade = document.querySelectorAll(".seat-grade input, #additional-grade input");

    for (let i = 0; i < grade.length; i += 7) {
        let seat = {};

        seat.seatStartRow = grade[i].value;
        seat.seatEndRow = grade[i + 1].value;
        seat.concertDate = grade[i + 2].value;
        seat.seatStartCol = grade[i + 3].value;
        seat.seatEndCol = grade[i + 4].value;
        seat.grade = grade[i + 5].value;
        seat.price = grade[i + 6].value;

        seatList.push(seat);
    }

    return JSON.stringify(seatList);
}

function concertForm() {
    const concert = {};

    const category = document.querySelectorAll("#concert-category input[type='radio']");
    concert.categoryNo = 0;
    for(let ele of category) {
        if(ele.checked === true) {
            concert.categoryNo = ele.value;
            break;
        }
    }

    concert.concertTitle = $("input[name='concertTitle']").val();
    concert.concertRuntime = $("input[name='concertRuntime']").val();
    concert.ageLimit = $("input[name='ageLimit']").val();
    concert.theaterNo = $("input[name='theaterNo']").val();
    concert.concertMembers = $("input[name='concertMembers']").val();
    concert.concertProduction = $("input[name='concertProduction']").val();
    concert.concertPlot = $(".note-editing-area>.note-editable").html();

    return JSON.stringify(concert);
}

function seatSample(_this) {
    const theaterNo = document.querySelector("#theater input[name=theaterNo]").value;
    if (!theaterNo) {
        alert("선택된 공연장이 없습니다.");
        _this.removeAttribute("data-toggle");
        _this.removeAttribute("data-target");
        return;
    }

    _this.setAttribute("data-toggle", "modal");
    _this.setAttribute("data-target", "#theater-modal");

    selectSeat({ theaterNo }, (res) => setSeat(res));
}

function setSeat(result) {
    const tbody = document.querySelector(".modal-body tbody");
    const thead = document.querySelector(".modal-body thead");
    const theater = result.theater;
    const impossibleSeatList = result.impossibleSeatList;
    tbody.innerHTML = ``;
    thead.innerHTML = ``;

    for (let i = 0; i <= theater.theaterCol; i++) {
        const th = document.createElement("th");
        if (i === 0) {
            th.innerHTML = `&nbsp;`;
        } else {
            th.innerHTML = i;
        }
        thead.appendChild(th);
    }

    for (let i = 0; i <= theater.theaterRow; i++) {
        const tr = document.createElement("tr");
        const input = decimalToBase26(i);
        for (let j = 0; j <= theater.theaterCol; j++) {
            const th = document.createElement("th");
            if (j === 0) {
                th.innerHTML = `${input}`;
                tr.appendChild(th);
                continue;
            }
            th.setAttribute("class", "seat-yes");
            th.setAttribute("id", (i + 1) + "-" + j);
            for (let seat of impossibleSeatList) {
                if (th.id === seat.impossibleSeatRow + "-" + seat.impossibleSeatCol) {
                    th.setAttribute("class", "seat-no");
                    break;
                }
            }
            th.innerHTML = `&nbsp`;
            tr.appendChild(th);
        }
        tbody.appendChild(tr);
    }
}