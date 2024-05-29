$(function() { 
    const userNo = $("input[name='userNo']").val();
    const concertNo =  $("input[name='concertNo']").val();
    // const conDetailTab = document.getElementsByClassName("concert-detail-hr");

    conNaviDraw(conList => drawConNavi(conList));
    conHeart({
        "userNo" : userNo,
        "concertNo" : concertNo
    }, (conL) => insertLike(conL, userNo, concertNo))
    
    // conDetailTab({"concertNo" : concertNo}, (result) => conDetailTab(data, result))
});

// let heartClick = document.getElementsByClassName("concert-detail-like-button");

// heartClick.addEventListener("click", function(){

// });


// function insertLike(like, userNo, concertNo){
//   console.log("alertMsg");    

// }


// function conDetailTab(data, result){
//   const drawSection = document.querySelector(".concert-detail-tab");

//     drawSection.innerHTML +=  `<div class="concert-detail-subject">
//                                 <br>
//                                 <span><h2>작품소개</h2></span>
//                                 <div>
//                                 +    ${fn:replace(con.concertPlot, replaceChar, "<br/>")}
//                                 </div>
//                             </div>
//                             <br><br>
//                             <div class="concert-detail-subject">
//                                 <span><h2>공지사항</h2></span>
//                                 <img src="${pageContext.request.contextPath}${con.filePath}${con.changeName}" alt="">
//                             </div>
//                             <br><br>`

//         sliderContentDiv.onclick = function goDetail(){
//       location.href = 'detail.co?concertNo=' + concertNo;
//     }

// }

 
// ajax로 콘서트 navi 그려
function drawConNavi(conList){
  
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




// 세부페이지 노란부분
// window.onload = function() {
//     const detailPic = document.querySelector(".concert-detail-pic");
//     detailPic.innerHTML = `<img src="` + contextPath + con.filePath + con.changeName + `"alt="">`    
// }





// 예매버튼 클릭
function reservePage(){
    window.open('/staez/selectDate.co' , "_blank", "width=1001, height=601, scrollbars=no");
}

