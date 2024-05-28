// 공연메인페이지 슬라이더 slick sliker api
$(function() { // list는 컨트롤러에서 받아온 것
    const userNo = document.getElementsByName("userNo");
    const concertNo =  document.getElementsByName("concertNo");

    conNaviDraw(conList => drawConNavi(conList));
    conHeart({
        "userNo" : $("input[name='userNo']").val(),
        "concertNo" : $("input[name='concertNo']").val()
    }, (like) => insertLike(like, userNo, concertNo)) 
});



  
  // ajax로 콘서트 navi 그려
  function drawConNavi(conList){
    console.log(conList)
  
    const concertNaviArea = document.querySelector(".concert-ul");
    concertNaviArea.innerHTML = ``;
  
    for(let c of conList){
      let naviLi = document.createElement('li');
      naviLi.innerHTML = `<h2 id="`+ c.categoryNo +`">`+ c.categoryName +`</h2>`;
  
      naviLi.setAttribute("onclick", `location.href ='main.co?categoryNo=${c.categoryNo}'`)
  
      concertNaviArea.appendChild(naviLi);
    }
    
  }



  // 찜버튼(하트)눌러서 색 채우기
function likeToggle(_this) {
    // const check = _this.children[1];
    // check.checked = !check.checked;
    // fa-solid && fa-regular
    _this.children[0].classList.toggle("fa-solid");
    _this.children[0].classList.toggle("fa-regular");
}

function insertLike(like, userNo, concertNo){
    if(userNo != null){

    }


}


// 세부페이지 노란부분
// window.onload = function() {
//     const detailPic = document.querySelector(".concert-detail-pic");
//     detailPic.innerHTML = `<img src="` + contextPath + con.filePath + con.changeName + `"alt="">`    
// }





// 예매버튼 클릭
function reservePage(){
    window.open('/staez/selectDate.co' , "_blank", "width=1001, height=601, scrollbars=no");
}

