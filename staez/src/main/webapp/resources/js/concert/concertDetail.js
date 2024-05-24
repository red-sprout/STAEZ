// 찜버튼(하트)눌러서 색 채우기
function likeToggle(_this) {
    // const check = _this.children[1];
    // check.checked = !check.checked;
    // fa-solid && fa-regular
    _this.children[0].classList.toggle("fa-solid");
    _this.children[0].classList.toggle("fa-regular");
}
// 예매버튼 클릭
function reservePage(){
    window.open('/staez/selectDate.co' , "_blank", "width=1001, height=601, scrollbars=no");
}

// 누르면 다른 페이지로




// 누르면 다른 페이지로 가는 자스는 틀이 같아야
// function openTab(pageName, elmnt) {
//     var i, dPageContent, dNaviLink;
//     dPageContent = document.getElementsByClassName("dPageContent");
//     for (i = 0; i < dPageContent.length; i++) {
//         dPageContent[i].style.display = "none";
//     }
//     dNaviLink = document.getElementsByClassName("dNaviLink");
//     for (i = 0; i < dNaviLink.length; i++) {
//         dNaviLink[i].classList.remove("active");
//     }
//     document.getElementById(pageName).style.display = 'block';
//     elmnt.classList.add("active");
// }

// // 페이지 로드 시 기본으로 열릴 콘텐츠 설정
// window.onload = function() {
//     document.getElementById("defaultOpen").click();
// }
