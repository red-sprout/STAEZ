// 공연메인페이지 슬라이더 slick sliker api
$(function() {
  conMainSlider((list) => (drawConMainSlider(list)));
  conMainSliderPic((res) => (drawConMainSliderPic(res)));
});

// 임시, 공연세부페이지로
function goDetail(concertNo) {
  location.href = 'detail.co?concertNo=' + concertNo;
}


function drawConMainSlider(list){
  const sliderContent = document.querySelector(".concert-main-upper");
  
  // sliderContent.innerHTML = ``;
  for(let c of list){
    sliderContent.innerHTML += `<div class="concert-main-upper-pic-div">`
                              + `<img src="https://tickets.interpark.com/contents/_next/image?url=http%3A%2F%2Fticketimage.interpark.com%2FTCMS3.0%2FGMain%2FClas%2F2404%2F240425024045_24005737.gif&w=384&q=75" alt="">`
                              + `<div class="concert-main-upper-sen-div">
                                    <p><span><b><h2>` + c.concertTitle + `</h2></span></b></p>
                                    <p><span>` + c.theaterName + `</span></p>
                                    <p><span>` + c. theaterName + `-` + c.endDate + `</span></p>`
                              + `</div>`
                            + `</div>`
  }

  drawConMainSliderPic
  
  $.noConflict();
  $(".concert-main-upper").slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    arrows: true,
    autoplay: true,
    autoplaySpeed: 1250,
    prevArrow: $(".concert-main-upper-before"),
    nextArrow: $(".concert-main-upper-next")
  });
}


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


