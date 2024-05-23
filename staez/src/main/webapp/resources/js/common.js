const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const origin = window.location.origin;
const contextPath = origin + pathname;

function init() {
    const url = document.location.pathname;
    const menubarArr = [contextPath + "main.co", contextPath + "main.cm", contextPath + "main.no", contextPath + "main.iq", contextPath + "userList.ad"];
    const menubar = document.querySelectorAll(".menu-bar>a");
    for(let i in menubarArr) {
        if(url == menubarArr[i]) {
            menubar[i].style = "color: #B51B75";
            break;
        }
    }
}