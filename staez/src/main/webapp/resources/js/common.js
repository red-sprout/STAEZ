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