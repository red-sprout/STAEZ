const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const origin = window.location.origin;
const contextPath = origin + pathname;

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

function toggleCategory(_this, id) {
    const categoryBtn = document.querySelectorAll(`#${id}>.btn-staez`);
    const categoryRadio = document.querySelectorAll(`#${id} input[name='categoryNo']`);
    for(let i in categoryBtn) {
        try {
            categoryBtn[i].classList.remove("checked");
            if(categoryBtn[i] === _this) {
                _this.classList.add("checked");
                categoryRadio[i].setAttribute("checked", true);
            } else {
                categoryRadio[i].removeAttribute("checked");
            }
        } catch (error) {
            continue;
        }
    }
}