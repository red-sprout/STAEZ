function likeToggle(_this) {
    // const check = _this.children[1];
    // check.checked = !check.checked;
    // fa-solid && fa-regular
    _this.children[0].classList.toggle("fa-solid");
    _this.children[0].classList.toggle("fa-regular");
}

function reservePage(){
    window.open('/staez/selectDate.co' , "_blank", "width=1001, height=601, scrollbars=no");
}

