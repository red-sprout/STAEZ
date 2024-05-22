let contextPath = "";

function init(path) {
    contextPath = path;
    const url = document.location.pathname;
    const menubarArr = [path + "/main.co", path + "/main.cm", path + "/main.no", path + "/main.iq", path + "/userList.ad"];
    const menubar = document.querySelectorAll(".menu-bar>a");
    for(let i in menubarArr) {
        if(url == menubarArr[i]) {
            menubar[i].style = "color: #B51B75";
            break;
        }
    }
}

function getAjax(url, data, callback, msg) {
    $.ajax({
        url: url,
        data: data,
        success : function(res) {
            callback(res);
        }, error() {
            console.log(msg);
        }
    });
}