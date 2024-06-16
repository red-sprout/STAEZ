// 공연메인페이지 슬라이더 slick sliker api
$(function() { // list는 컨트롤러에서 받아온 것
  const sliderContent = document.querySelector(".concert-main-upper");
  const gridContent = document.querySelector(".concert-main-grid");
  
  conNaviDraw(conList => drawConNavi(conList));

  const categoryNo = document.querySelector("input[name='categoryNo']").value;
  ajaxCategoryList({"categoryNo" : categoryNo}, (list)=>drawSliderMain(list, sliderContent));
  ajaxCategoryList({"categoryNo" : categoryNo}, (list)=>drawGridMain(list, gridContent));

});



// ajax로 콘서트 navi 그려
function drawConNavi(conList){
  console.log(conList)
  const concertNaviArea = document.querySelector(".concert-ul");
  concertNaviArea.innerHTML = ``;

  for(let c of conList){

    let naviLi = document.createElement('li');
    naviLi.innerHTML = ``;
    naviLi.innerHTML = `<h2 id="`+ c.categoryNo +`">`+ c.categoryName +`</h2>
                        <input type="hidden" name="concertNo" value=`+ c. categoryNo +`>`;

    naviLi.setAttribute("onclick", `location.href ='main.co?categoryNo=`+ c.categoryNo +`'`)

    concertNaviArea.appendChild(naviLi);
  }
}


// 슬라이더 그려주기
function drawSliderMain(list, sliderContent){
  // const sliderContentDiv = document.createElement('div');
  // const gridContentDiv = document.createElement('div');
  
  sliderContent.innerHTML =``;

  if(list.length === 0){
    sliderContent.innerHTML =``;
  }
  
  for (let c of list) {

    // 제일 마지막으로 등록된 공연만 클릭되는 이유?

    // ChatGPT
    // sliderContent.onclick 이벤트를 각각의 sliderContent에 바인딩할 때, 클로저(closure) 문제가 발생할 수 있습니다. 클로저 문제란 이벤트 핸들러 함수가 외부 변수를 참조할 때, 이벤트 핸들러 함수가 정의된 시점의 변수 값으로만 접근한다는 것을 의미합니다. 이 경우에는 각각의 이벤트 핸들러 함수가 아닌 마지막 이벤트 핸들러 함수가 전역 변수인 c의 최종 값으로 접근합니다.
    // 이 문제를 해결하기 위해서는 클로저 문제를 회피해야 합니다. 각각의 이벤트 핸들러 함수에서 c 변수를 받아오는 방식으로 수정하면 됩니다. 아래는 수정된 코드입니다.
    const concertDiv = document.createElement('div');
    concertDiv.className = 'concert-main-upper-pic-div';
    
    concertDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                  + `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                  + `<div class="concert-main-upper-sen-div">
                                      <p><span><b><h2>` + c.concertTitle + `</h2></span></b></p>
                                      <p><span>` + c.theaterName + `</span></p>
                                      <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                                 + `</div>`;
    // sliderContent.appendChild(sliderContentDiv);
    // sliderContent.setAttribute("onclick", `location.href ='maincon.co?concertNo=`+ c.concertNo +`'`)
    
    sliderContent.appendChild(concertDiv);

    // 임시, 공연세부페이지로
    concertDiv.onclick = function() {
      location.href = 'detail.co?concertNo=' + c.concertNo;
    };

  }
}

// 그리드 그려주기
function drawGridMain(list, gridContent){
  // const sliderContentDiv = document.createElement('div');
  // const gridContentDiv = document.createElement('div');
  
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';
  
  for (let c of list) {

    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                              + `<div>`
                              +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                              + `</div>`
                              + `<div>`
                              +     `<p><span>` + c.categoryName + `</span></p>`
                              +     `<p><span><b>[` + c.concertTitle + `]</b></span></p>
                                    <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                            + `</div>`
                            
    gridContent.appendChild(concertGridDiv);                   
    concertGridDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }
  }

} else {
  gridContent.style.display = 'flex';
  gridContent.style.justifyContent = 'center';
  gridContent.style.alignItems = 'center';
  gridContent.style.height = '100%';

  const concertGridDiv = document.createElement('div');
  concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
  concertGridDiv.style.fontSize = '24px';
  concertGridDiv.style.padding = '40% 0 50% 0';
  concertGridDiv.style.textAlign = 'center';

  gridContent.appendChild(concertGridDiv);

}
}





// 공연메인페이지 전체보기
function allListClick(){
 console.log("클릭");
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;
  ajaxCategoryList({"categoryNo" : categoryNo}, (list)=>drawAllList(list, gridContent));
}


// 공연메인페이지 인기순위 최신공연 별점높은
function popularClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  popular({"categoryNo" : categoryNo}, (list) => drawPopular(list, gridContent));
}

function latestClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  latest({"categoryNo" : categoryNo}, (list) => drawLatest(list, gridContent));
}

function highscoreClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  highscore({"categoryNo" : categoryNo}, (list) => drawHighscore(list, gridContent));
}

function drawAllList(list, gridContent){
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of list) {
      const concertGridDiv = document.createElement('div');
      concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                + `<div>`
                                +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.categoryName + `</span></p>`
                                +     `<p><span><b>[` + c.concertTitle + `]</b></span></p> 전체
                                      <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'detail.co?concertNo=' + c.concertNo;
      }
    }
  } else {
    gridContent.style.display = 'flex';
    gridContent.style.justifyContent = 'center';
    gridContent.style.alignItems = 'center';
    gridContent.style.height = '100%';
  
    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
    concertGridDiv.style.fontSize = '24px';
    concertGridDiv.style.padding = '40% 0 50% 0';
    concertGridDiv.style.textAlign = 'center';
  
    gridContent.appendChild(concertGridDiv);
  
  }
}



function drawPopular(list, gridContent){
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

  for (let c of list) {
    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                              + `<div>`
                              +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                              + `</div>`
                              + `<div>`
                              +     `<p><span>` + c.categoryName + `</span></p>`
                              +     `<p><span><b>[` + c.concertTitle + `]</b></span></p> 인기
                                    <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                            + `</div>`
                            
    gridContent.appendChild(concertGridDiv);                   
    concertGridDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }
  }

} else {
  gridContent.style.display = 'flex';
  gridContent.style.justifyContent = 'center';
  gridContent.style.alignItems = 'center';
  gridContent.style.height = '100%';

  const concertGridDiv = document.createElement('div');
  concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
  concertGridDiv.style.fontSize = '24px';
  concertGridDiv.style.padding = '40% 0 50% 0';
  concertGridDiv.style.textAlign = 'center';

  gridContent.appendChild(concertGridDiv);

}
}

function drawLatest(list, gridContent){
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of list) {
      const concertGridDiv = document.createElement('div');
      concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                + `<div>`
                                +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.categoryName + `</span></p>`
                                +     `<p><span><b>[` + c.concertTitle + `]</b></span></p> 최신
                                      <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'detail.co?concertNo=' + c.concertNo;
      }
    }
  } else {
    gridContent.style.display = 'flex';
    gridContent.style.justifyContent = 'center';
    gridContent.style.alignItems = 'center';
    gridContent.style.height = '100%';

    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
    concertGridDiv.style.fontSize = '24px';
    concertGridDiv.style.padding = '40% 0 50% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);

  }
  
}

function drawHighscore(list, gridContent){
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of list) {
      const concertGridDiv = document.createElement('div');
      concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                + `<div>`
                                +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.categoryName + `</span></p>`
                                +     `<p><span><b>[` + c.concertTitle + `]</b></span></p> 별점
                                      <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'detail.co?concertNo=' + c.concertNo;
      }
    }

  } else {
    gridContent.style.display = 'flex';
    gridContent.style.justifyContent = 'center';
    gridContent.style.alignItems = 'center';
    gridContent.style.height = '100%';

    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
    concertGridDiv.style.fontSize = '24px';
    concertGridDiv.style.padding = '40% 0 50% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);

  }
}


// 지역전체만 따로
function locationClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  ajaxCategoryList({"categoryNo" : categoryNo}, (list) => drawLocation(list, gridContent));
}

function drawLocation(list, gridContent){
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of list) {
      const concertGridDiv = document.createElement('div');
      concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                                + `<div>`
                                +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.categoryName + `</span></p>`
                                +     `<p><span><b>[` + c.concertTitle + `]</b></span></p> 지역전체
                                      <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'detail.co?concertNo=' + c.concertNo;
      }
  }

  } else {
    gridContent.style.display = 'flex';
    gridContent.style.justifyContent = 'center';
    gridContent.style.alignItems = 'center';
    gridContent.style.height = '100%';

    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
    concertGridDiv.style.fontSize = '24px';
    concertGridDiv.style.padding = '40% 0 50% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);

  }
}


function locationArea(area){

  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  locationAll({"categoryNo" : categoryNo, "area": area}, (list) => drawLocationAll(list, gridContent));

}


function drawLocationAll(list, gridContent){

  if (!gridContent) {
    console.error("Element with class 'concert-main-grid' not found.");
    return;
  }

  gridContent.innerHTML = ``;
  if(list.length > 0){

    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

  for (let c of list) {
    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML += `<input type="hidden" name="concertNo" value="` + c.concertNo + `"></input>`
                              + `<div>`
                              +     `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                              + `</div>`
                              + `<div>`
                              +     `<p><span>` + c.categoryName + `</span></p>`
                              +     `<p><span><b>[` + c.concertTitle + `]</b></span></p> 지역
                                    <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                            + `</div>`
                            
    gridContent.appendChild(concertGridDiv);                   
    concertGridDiv.onclick = function goDetail(){
      location.href = 'detail.co?concertNo=' + c.concertNo;
    }
    
    }

  } else {
    // 이걸로 잡으면 TypeError: Cannot set properties of null (setting 'innerHTML') 발생
    // 그런데 
    // const girdSection = document.querySelector(".concert-main-grid");
    // 로 잡으면 오류 발생 x
    // grid section 밑에 바로 잡으면 왜 왜왜오애ㅙㅐ 오류 발생?
    
    // const noconert = documnet.querySelector(".no-concert");
    // const noconertDiv = document.createElement('div');
    // noconert.appendChild(noconertDiv); 

    // noconertDiv.innerHTML += "등록된 공연이 없습니다.";
    // noconertDiv.style.fontSize = '24px';
    // noconertDiv.style.padding = '15% 0 15% 0';

    // 이렇게 하면 grid가 아닌 아래상태에 적용이 되는데 어떻게 해야하져?
    // 아하 스타일도 초기화해 줘야함!!
    
    gridContent.style.display = 'flex';
    gridContent.style.justifyContent = 'center';
    gridContent.style.alignItems = 'center';
    gridContent.style.height = '100%';

    const concertGridDiv = document.createElement('div');
    concertGridDiv.innerHTML = "등록된 공연이 없습니다.";
    concertGridDiv.style.fontSize = '24px';
    concertGridDiv.style.padding = '40% 0 50% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);
  
  }
}

  
  // 슬릭 슬라이더 api 설정
  $(window).on('load', function() {
  $.noConflict();
  $(".concert-main-upper").slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    arrows: true,
    // autoplay: true,
    autoplaySpeed: 1250,
    variableWidth: true,
    prevArrow: $(".concert-main-upper-before"),
    nextArrow: $(".concert-main-upper-next"),
    responsive: [ // 반응형 웹 구현 옵션
    {  
      breakpoint: 1000, //화면 사이즈 960px
      settings: {
        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
        slidesToShow:3,
        arrows: false
      } 
    },
    { 
      breakpoint: 750, //화면 사이즈 768px
      settings: {	
        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
        slidesToShow: 2,
        arrows: false
      }
     } ,
      {
        breakpoint: 485,
        settings: {
          slidesToShow: 1,
          arrows: false
        }
    }
  ]
  })
});




