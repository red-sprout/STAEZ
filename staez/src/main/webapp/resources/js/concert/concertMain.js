// 공연메인페이지 슬라이더 slick sliker api
$(function() { // list는 컨트롤러에서 받아온 것
  const sliderContent = document.querySelector(".concert-main-upper");
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;


  conNaviDraw(conList => drawConNavi(conList));

  ajaxCategoryList({"categoryNo": categoryNo}, (list) => {
    drawSliderMain(list, sliderContent);
    drawGridMain(list, gridContent, currentPage, itemsPerPage);
      window.addEventListener('scroll', () => handleScroll(list, gridContent));
    slick();

  });
    
  // ajaxCategoryList({"categoryNo" : categoryNo}, (list)=>drawGridMain(list, gridContent));
  // concertStar({"concertNo" : concertNo}, (result) => drawConcertStar(result));

});


// // 별점 구현
// function drawConcertStar(result) {
//   const starDiv = document.createElement('div');

//   .append(starDiv)
//   let scoreSum = 0;
//   for(let c of result){
//       scoreSum += c.score
//   }
//   // 평균 점수 계산 및 반올림
//   let avgScore = Math.round(scoreSum / result.length);
//   // 별 이미지 초기화
//   tdStar.innerHTML = '';

//   // 반올림된 평균 점수만큼 별 이미지 추가
//   for (let i = 0; i < avgScore; i++) {
//       const img = document.createElement('img');
//       img.id = "concert-detail-starImg";
//       img.src = contextPath + `/resources/img/concert/star.png`;
//       img.alt = "Star";
//       tdStar.appendChild(img);
//   }
// }




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
  
  const del1 = document.querySelector(".concert-main-upper-section");
  const del2 = document.querySelector(".running-concert");
  const del3 = document.querySelector(".concert-main-hr");
  const del4 = document.querySelector(".concert-main-list-section");
  const del5 = document.querySelector(".concert-main-grid-section");
  
  sliderContent.innerHTML =``;

  if(list.length === 0){
    del1.innerHTML = "등록된 공연이 없습니다.";
    del1.style.fontSize = '24px';
    del1.style.justifyContent = 'center';
    del2.style.display = 'none';
    del3.style.display = 'none';
    del4.style.display = 'none';
    del5.style.display = 'none';
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
function drawGridMain(list, gridContent, page, itemsPerPage){
  
  
  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';
  
  for (let c of items) {

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
  concertGridDiv.style.padding = '55% 0 75.5% 0';
  concertGridDiv.style.textAlign = 'center';

  gridContent.appendChild(concertGridDiv);

}
}


function clickHandler(_this){

  console.log(_this)
  const gridContent = document.querySelector(".concert-main-grid");
  const categoryNo = document.querySelector("input[name='categoryNo']").value;
  
  currentPage = 1;

  window.removeEventListener('scroll', handleScroll);

  if(_this === 'all'){
    ajaxCategoryList({"categoryNo" : categoryNo}, (list) => {
      drawAllList(list, gridContent, currentPage, itemsPerPage);
        window.addEventListener('scroll', () => handleScroll(list, gridContent, _this));
      });
  } else if (_this === 'popular'){
    popular({"categoryNo" : categoryNo}, (list) => {
      drawPopular(list, gridContent, currentPage, itemsPerPage);
    
        // 무한 스크롤을 위한 스크롤 이벤트 리스너 추가
        window.addEventListener('scroll', () => handleScroll(list, gridContent, _this));
      });
  } else if (_this === 'latest'){
    latest({"categoryNo" : categoryNo}, (list) => {
      drawLatest(list, gridContent, currentPage, itemsPerPage);
      window.addEventListener('scroll', () => handleScroll(list, gridContent, _this));
    });
  } else if (_this === 'highscore'){
    highscore({"categoryNo" : categoryNo}, (list) => {
      drawHighscore(list, gridContent, currentPage, itemsPerPage);
    window.addEventListener('scroll', () => handleScroll(list, gridContent, _this));
  });
  } else if (_this === 'locationAll'){
    ajaxCategoryList({"categoryNo" : categoryNo, "area": _this}, (list) => { // 지역전체
      drawLocation(list, gridContent, currentPage, itemsPerPage);
   window.addEventListener('scroll', () => handleScroll(list, gridContent, _this));
    });
  } else {
    locationAll({"categoryNo" : categoryNo, "area": _this}, (list) => {
       drawLocationAll(list, gridContent, currentPage, itemsPerPage);
    window.addEventListener('scroll', () => handleScroll(list, gridContent, _this));
    });
  }

}

// // 지역전체만 따로
// function (list, gridContent, page, itemsPerPage) {
//   const gridContent = document.querySelector(".concert-main-grid");
//   const categoryNo = document.querySelector("input[name='categoryNo']").value;

//   ajaxCategoryList({"categoryNo" : categoryNo}, (list) => drawLocation(list, gridContent));
// }


// 공연메인페이지 전체보기
// function allListClick(){
//  console.log("클릭");
//   const gridContent = document.querySelector(".concert-main-grid");
//   const categoryNo = document.querySelector("input[name='categoryNo']").value;
//   ajaxCategoryList({"categoryNo" : categoryNo}, (list)=>drawAllList(list, gridContent));
// }


// // 공연메인페이지 인기순위 최신공연 별점높은
// function popularClick() {
//   const gridContent = document.querySelector(".concert-main-grid");
//   const categoryNo = document.querySelector("input[name='categoryNo']").value;

//   popular({"categoryNo" : categoryNo}, (list) => drawPopular(list, gridContent));
// }

// function latestClick() {
//   const gridContent = document.querySelector(".concert-main-grid");
//   const categoryNo = document.querySelector("input[name='categoryNo']").value;

//   latest({"categoryNo" : categoryNo}, (list) => drawLatest(list, gridContent));
// }

// function highscoreClick() {
//   const gridContent = document.querySelector(".concert-main-grid");
//   const categoryNo = document.querySelector("input[name='categoryNo']").value;

//   highscore({"categoryNo" : categoryNo}, (list) => drawHighscore(list, gridContent));
// }


let currentPage = 1;  // 현재 페이지 번호
const itemsPerPage = 10;  // 페이지당 표시할 항목 수
let isLoading = false;  // 로딩 중인지 여부를 추적하는 변수

function drawAllList(list, gridContent, page, itemsPerPage){

  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of items) {
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
    concertGridDiv.style.padding = '55% 0 75.5% 0';
    concertGridDiv.style.textAlign = 'center';
  
    gridContent.appendChild(concertGridDiv);
  
  }
}



function drawPopular(list, gridContent, page, itemsPerPage){
  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);


  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

  for (let c of items) {
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
  concertGridDiv.style.padding = '55% 0 75.5% 0';
  concertGridDiv.style.textAlign = 'center';

  gridContent.appendChild(concertGridDiv);

}
}

function drawLatest(list, gridContent, page, itemsPerPage){

  list.sort((a, b) => new Date(b.prfpdfrom) - new Date(a.prfpdfrom));

  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);


  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of items) {
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
    concertGridDiv.style.padding = '55% 0 75.5% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);

  }
  
}

function drawHighscore(list, gridContent, page, itemsPerPage){

  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of items) {
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
    concertGridDiv.style.padding = '55% 0 75.5% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);

  }
}




function drawLocation(list, gridContent, page, itemsPerPage){

  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);

  if(list.length > 0){
    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

    for (let c of items) {
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
    concertGridDiv.style.padding = '55% 0 75.5% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);

  }
}


// function locationArea(area){

//   const gridContent = document.querySelector(".concert-main-grid");
//   const categoryNo = document.querySelector("input[name='categoryNo']").value;

//   locationAll({"categoryNo" : categoryNo, "area": area}, (list) => drawLocationAll(list, gridContent));

// }


function drawLocationAll(list, gridContent, page, itemsPerPage){

  if (page === 1) {
    gridContent.innerHTML = ``;  // 처음 페이지일 경우 내용을 초기화
  }

  const startIndex = (page - 1) * itemsPerPage;
  const endIndex = page * itemsPerPage;
  const items = Object.values(list).slice(startIndex, endIndex);

  gridContent.innerHTML = ``;
  if(list.length > 0){

    gridContent.style.display = '';
    gridContent.style.justifyContent = '';
    gridContent.style.alignItems = '';
    gridContent.style.height = '';

  for (let c of items) {
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
    concertGridDiv.style.padding = '55% 0 75.5% 0';
    concertGridDiv.style.textAlign = 'center';

    gridContent.appendChild(concertGridDiv);
  
  }
}




// 페이지네이션 이벤트
function handleScroll(list, gridContent, _this) {
  const { scrollTop, scrollHeight, clientHeight } = document.documentElement;

  if (scrollTop + clientHeight >= scrollHeight - 5 && !isLoading) {
    isLoading = true;
    currentPage++;


    //색 있는 클래스를 다 하나 오면 그 안에 innerHtml 인기순, 최신순, 전체 
    // 새로운 페이지를 로드하여 그리기 함수를 호출
     // popular-mode인 경우에만 drawPopular 호출

      if(_this === 'all'){
        drawAllList(list, gridContent, currentPage, itemsPerPage);
      } else if (_this === 'popular'){
        drawPopular(list, gridContent, currentPage, itemsPerPage);
      } else if (_this === 'latest'){
        drawLatest(list, gridContent, currentPage, itemsPerPage);  
      } else if (_this === 'highscore'){
        drawHighscore(list, gridContent, currentPage, itemsPerPage);  
      } else if (_this === 'locationAll'){
        drawLocation(list, gridContent, currentPage, itemsPerPage);  
      } else if (_this === '서울' || _this === '경기' ||_this === '강원' ||
                  _this === '충청' ||_this === '전라' ||_this === '경상' ||_this === '제주') {
        drawLocationAll(list, gridContent, currentPage, itemsPerPage);
      } else {
        drawGridMain(list, gridContent, currentPage, itemsPerPage);
      } 
      

    // 로딩이 끝난 후에 isLoading 변수를 false로 설정
    isLoading = false;
  }
}

  
  // 슬릭 슬라이더 api 설정
  function slick() {
    $.noConflict();
    $(".concert-main-upper").slick({
      infinite: true,
      slidesToShow: 5,
      slidesToScroll: 1,
      arrows: true,
      autoplay: true,
      autoplaySpeed: 1250,
      variableWidth: true,
      centeredSlides: true,
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
  