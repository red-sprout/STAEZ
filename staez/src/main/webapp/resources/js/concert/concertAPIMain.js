$(function() { // list는 컨트롤러에서 받아온 것
  const sliderContent = document.querySelector(".concert-main-upper");
  const gridContent = document.querySelector(".concert-main-grid");
  conNaviDraw(conList => drawConNavi(conList));
  showLoading();

  ajaxCategoryListAPI((list)=>{
    drawSliderMain(list, sliderContent)
    drawGridMain(list, gridContent)
    slick()
    hideLoading()
  });
});

function showLoading(){
  const loadingPage = document.getElementById('load');
  loadingPage.innerHTML = `<img src="` + contextPath + `/resources/img/concert/loading.gif" alt="loading">`;
};

function hideLoading(){
  const loadingPage = document.getElementById('load');
  loadingPage.innerHTML = ``;
  loadingPage.style.display = 'none';
};


// ajax로 콘서트 navi 그려
function drawConNavi(conList){
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
  drawAPINavi(concertNaviArea)
}

// API용 navi 추가
function drawAPINavi(concertNaviArea) {
  let naviLi = document.createElement('li');
  naviLi.innerHTML += `<li onclick="location.href ='conapi.co'"><h2>외부공연연결</h2></li> `
  concertNaviArea.appendChild(naviLi);
}


// 슬라이더 그려주기
function drawSliderMain(list, sliderContent){

  sliderContent.innerHTML =``;

  if(list.length === 0){
    sliderContent.innerHTML =``;
  }
  
  for (let c of list) {
    const concertDiv = document.createElement('div');
    concertDiv.className = 'concert-main-upper-pic-div';
    
    concertDiv.innerHTML += `<img src="` + c.poster + `"alt="">`
                             + `<input type="hidden" name="concertId" value="` + c.mt20id + `">`
                                  + `<div class="concert-main-upper-sen-div">
                                      <p><span><b><h2>` + c.prfnm + `</h2></span></b></p>
                                      <p><span>` + c.fcltynm + `</span></p>
                                      <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                                 + `</div>`;
    
    sliderContent.appendChild(concertDiv);

    // 임시, 공연세부페이지로
    concertDiv.onclick = function() {
      location.href = 'condeapi.co?concertId=' + c.mt20id;
    };

  }
}

// 그리드 그려주기
function drawGridMain(list, gridContent){
  
  gridContent.innerHTML = ``;

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';
  
  for (let c of list) {

    const runningConcert = document.querySelector(".running-concert");
    runningConcert.innerHTML = `<br><br>
                                <h3>현재 진행중인&nbsp; <b id="concert-genre">` + c.genrenm + `</b></h3>
                                <br>`

    const concertGridDiv = document.createElement('div');
    concertGridDiv.className = 'concert-main-grid-div';
    concertGridDiv.innerHTML += `<input type="hidden" name="concertId" value="` + c.mt20id + `">`
                              +  `<div>`
                              +     `<img src="` + c.poster + `"alt="">`
                              + `</div>`
                              + `<div>`
                              +     `<p><span>` + c.genrenm + `</span></p>`
                              +     `<p><span><b>[` + c.prfnm + `]</b></span></p>
                                    <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                            + `</div> <br><br>`
                            
    gridContent.appendChild(concertGridDiv);                   
    concertGridDiv.onclick = function goDetail(){
      location.href = 'condeapi.co?concertId=' + c.mt20id;
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
  ajaxCategoryListAPI((list)=>drawAllList(list, gridContent));
}


// 공연메인페이지 인기순위 최신공연 별점높은
function popularClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  ajaxCategoryListAPI((list) => drawPopular(list, gridContent));
}

function latestClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  ajaxCategoryListAPI((list) => drawLatest(list, gridContent));
}

function highscoreClick() {
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;

  ajaxCategoryListAPI((list) => drawHighscore(list, gridContent));
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
      concertGridDiv.className = 'concert-main-grid-div';
      concertGridDiv.innerHTML += `<input type="hidden" name="mt20id" value="` + c.mt20id + `"></input>`
                                + `<div>`
                                +     `<img src="` + c.poster + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.genrenm + `</span></p>`
                                +     `<p><span><b>[` + c.prfnm + `]</b></span></p> 전체
                                      <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'condeapi.co?concertId=' + c.mt20id;
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
    concertGridDiv.className = 'concert-main-grid-div';
    concertGridDiv.innerHTML += `<input type="hidden" name="mt20id" value="` + c.mt20id + `"></input>`
                              + `<div>`
                              +     `<img src="` + c.poster + `"alt="">`
                              + `</div>`
                              + `<div>`
                              +     `<p><span>` + c.genrenm + `</span></p>`
                              +     `<p><span><b>[` + c.prfnm + `]</b></span></p> 인기
                                    <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                            + `</div>`
                            
    gridContent.appendChild(concertGridDiv);                   
    concertGridDiv.onclick = function goDetail(){
      location.href = 'condeapi.co?concertId=' + c.mt20id;
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
      concertGridDiv.className = 'concert-main-grid-div';
      concertGridDiv.innerHTML += `<input type="hidden" name="mt20id" value="` + c.mt20id + `"></input>`
                                + `<div>`
                                +     `<img src="` + c.poster + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.genrenm + `</span></p>`
                                +     `<p><span><b>[` + c.prfnm + `]</b></span></p> 최신
                                      <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'condeapi.co?concertId=' + c.mt20id;
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
      concertGridDiv.className = 'concert-main-grid-div';
      concertGridDiv.innerHTML += `<input type="hidden" name="mt20id" value="` + c.mt20id + `"></input>`
                                + `<div>`
                                +     `<img src="` + c.poster + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.genrenm + `</span></p>`
                                +     `<p><span><b>[` + c.prfnm + `]</b></span></p> 별점
                                      <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'condeapi.co?concertId=' + c.mt20id;
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

  ajaxCategoryListAPI((list) => drawLocation(list, gridContent));
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
      concertGridDiv.className = 'concert-main-grid-div';
      concertGridDiv.innerHTML += `<input type="hidden" name="mt20id" value="` + c.mt20id + `"></input>`
                                + `<div>`
                                +     `<img src="` + c.poster + `"alt="">`
                                + `</div>`
                                + `<div>`
                                +     `<p><span>` + c.genrenm + `</span></p>`
                                +     `<p><span><b>[` + c.prfnm + `]</b></span></p> 지역전체
                                      <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                              + `</div>`
                              
      gridContent.appendChild(concertGridDiv);                   
      concertGridDiv.onclick = function goDetail(){
        location.href = 'condeapi.co?concertId=' + c.mt20id;
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

  ajaxCategoryListAPI({"categoryNo" : categoryNo, "area": area}, (list) => drawLocationAll(list, gridContent));

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
    concertGridDiv.className = 'concert-main-grid-div';
    concertGridDiv.innerHTML += `<input type="hidden" name="mt20id" value="` + c.mt20id + `"></input>`
                              + `<div>`
                              +     `<img src="` + c.poster + `"alt="">`
                              + `</div>`
                              + `<div>`
                              +     `<p><span>` + c.genrenm + `</span></p>`
                              +     `<p><span><b>[` + c.prfnm + `]</b></span></p> 지역
                                    <p><span>` + c.prfpdfrom + ` - ` + c.prfpdto + `</span></p>`
                            + `</div>`
                            
    gridContent.appendChild(concertGridDiv);                   
    concertGridDiv.onclick = function goDetail(){
      location.href = 'condeapi.co?concertId=' + c.mt20id;
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
  function slick() {
  $.noConflict();
  $(".concert-main-upper").slick({
    // infinite: true,
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
      breakpoint: 1024, //화면 사이즈 960px
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
  })
};




