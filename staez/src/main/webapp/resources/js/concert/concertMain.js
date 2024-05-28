// 공연메인페이지 슬라이더 slick sliker api
$(function() { // list는 컨트롤러에서 받아온 것
  const sliderContent = document.querySelector(".concert-main-upper");
  const gridContent = document.querySelector(".concert-main-grid");

  conNaviDraw(conList => drawConNavi(conList));
  conMainDraw(list => (drawConMain(list, sliderContent, gridContent)));

});

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



// 슬라이더 그려주기
function drawConMain(list, sliderContent, gridContent){

  for (let c of list) {

    // sliderContent에 HTML 추가
    const sliderContentDiv = document.createElement('div');
    sliderContentDiv.className = 'concert-main-upper-pic-div';
    sliderContentDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                + `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                + `<div class="concert-main-upper-sen-div">
                                    <p><span><b><h2>` + c.concertTitle + `</h2></span></b></p>
                                    <p><span>` + c.theaterName + `</span></p>
                                    <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                                + `</div>`;
    sliderContent.appendChild(sliderContentDiv);

    // 임시, 공연세부페이지로
    sliderContentDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }

    const gridContentDiv = document.createElement('div');
    gridContentDiv.className = 'concert-grid-div';
    gridContentDiv.innerHTML +=  `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                            + `<div>`
                            +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                            + `</div>`
                            + `<div>`
                            +     `<p><span>뮤지컬</span></p>`
                            +     `<p><span><b>[` + c.concertTitle + `]</b></span></p>
                                   <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                            + `</div>`
    gridContent.appendChild(gridContentDiv);                        
    gridContentDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }
  
  }

  
  // 슬릭 슬라이더 api 설정
  $.noConflict();
  $(".concert-main-upper").slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    arrows: true,
    autoplay: true,
    autoplaySpeed: 1250,
    // variableWidth: true,
    prevArrow: $(".concert-main-upper-before"),
    nextArrow: $(".concert-main-upper-next"),
    responsive: [ // 반응형 웹 구현 옵션
    {  
      breakpoint: 1000, //화면 사이즈 960px
      settings: {
        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
        slidesToShow:3
      } 
    },
    { 
      breakpoint: 750, //화면 사이즈 768px
      settings: {	
        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
        slidesToShow: 2

      }
     } ,
      {
        breakpoint: 485,
        settings: {
          slidesToShow: 1
        }
    }
  ]
  });


}



