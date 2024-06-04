const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const origin = window.location.origin;
const contextPath = origin + pathname;

const refCategoryMap = {
    concert: 1,
    community: 2,
    others: 3
}

const boardCodeMap = {
    notice: 1,
    community: 2,
    inquire: 3,
    faq: 4,
    report: 5
}

function init() {
    const url = window.location.pathname.split("/")[2];
    const menubarArr = ["main.co", "main.cm", "main.no", "main.iq", "userList.ad"];
    const menubar = document.querySelectorAll(".menu-bar>a");
    for(let i in menubarArr) {
        if(menubarArr[i] === url) {
            menubar[i].style = "color: #B51B75";
            break;
        }
    }
}

function setCategory(result, id) {
    const li = document.querySelector(`#${id}`);
    for(let ele of result) {
        let btn = `<button class="btn-staez" type="button" onclick="toggleCategory(this, '${id}');">
                        <h4>${ele.categoryName}</h4>
                    </button>`
        let input = `<input type="radio" name="categoryNo" class="hidden" value="${ele.categoryNo}">`
        li.innerHTML += btn;
        li.innerHTML += input;
    }
}

// 버튼 색, checked 속성 제거 및 초기화
function initBtnAttributes() {
    // 버튼 색 초기화
    const btnStaez = document.querySelectorAll("#community-category button");
    for(let ele of btnStaez) {
        ele.classList.remove("checked");
    }

    // checked 속성 제거
    const radioAll = document.querySelectorAll("#community-category input[type=radio]");
    for(let radio of radioAll) {
        radio.removeAttribute("checked");
    }
}

function toggleCategory(_this, id) {
    initBtnAttributes();
    const categoryBtn = document.querySelectorAll(`#${id}>.btn-staez`);
    const categoryRadio = document.querySelectorAll(`#${id} input[name='categoryNo']`);
    for(let i in categoryBtn) {
        try {
            categoryBtn[i].classList.remove("checked");
            if(categoryBtn[i] === _this) {
                _this.classList.add("checked");
                categoryRadio[i].setAttribute("checked", true);
            }
        } catch (error) {
            continue;
        }
    }
}

function commonMakeUrl(url, param) {
    Object.keys(param).forEach((key, index) => {
        url = url + (index === 0 ? "?" : "&") + key + "=" + param[key];
    });
    return url;
}

function getUrlParams() {
    const params = {};
    location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, (str, key, value) => { params[key] = value; });
    return params;
};

function getCategoryNo(_this, id) {
    let result = 0;
    const categoryBtn = document.querySelectorAll(`#${id}>.btn-staez`);
    const categoryRadio = document.querySelectorAll(`#${id} input[name='categoryNo']`);

    for (let i in categoryBtn) {
        if (categoryBtn[i] === _this) {
            result = categoryRadio[i].value;
            break;
        }
    }

    return result;
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