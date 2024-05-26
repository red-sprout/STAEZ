// 공연메인페이지 슬라이더 slick sliker api
$(function() { // list는 컨트롤러에서 받아온 것
  conMainSlider(list => (drawConMainSlider(list)));
});


// 임시, 공연세부페이지로
function goDetail(concertNo) {
  location.href = 'detail.co?concertNo=' + concertNo;
}



// 슬라이더 그려주기
function drawConMainSlider(list){
  const sliderContent = document.querySelector(".concert-main-upper");
  const gridContent = document.querySelector(".concert-main-grid");
  

  for (let c of list) {
    // sliderContent에 HTML 추가
    sliderContent.innerHTML += `<div class="concert-main-upper-pic-div">`
                              + `<img src="` + contextPath + c.filePath + c.changeName + `"alt="">`
                              + `<div class="concert-main-upper-sen-div">
                                    <p><span><b><h2>` + c.concertTitle + `</h2></span></b></p>
                                    <p><span>` + c.theaterName + `</span></p>
                                    <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                              + `</div>`
                            + `</div>`;
}
  // grid 부분
  for(let c of list){
    gridContent.innerHTML += 
                            `<div onclick="">`
                            + `<img src="` + contextPath + c.changeName + c.filePath + `"alt="">`
                            + `<div>`
                            + `<p><span>뮤지컬</span></p>`
                            + `<p><span><b>[` + c.concertTitle + `]</b></span></p>
                                <p><span>` + c.startDate + ` - ` + c.endDate + `</span></p>`
                            + `</div>
                            </div>`
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


  





// // 뮤지컬 누르면 화면 뜨게
// document.addEventListener('DOMContentLoaded', function() {
//   console.log("페이지 로드 완료");
  
//   let category = "classic"; // 원하는 카테고리를 여기에 넣으세요
//   let url = `main.co?category=${category}`;


//   // 버튼 클릭 이벤트 처리
//   let musical = document.querySelector('.concert-ul').children[0];
//   musical.addEventListener('click', function() {
//       console.log("버튼 클릭됨");
//       // 페이지 로드 함수 호출
//       loadPage(url); // 로드할 페이지 URL을 넣으세요
//   });
// });

// // 페이지 로드 함수 정의
// function loadPage(url) {
//   console.log("페이지 로드 시작: " + url);
//   window.location.href = url; // 페이지 로드
// }


