$(function() {
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
});

function goDetail(){
  window.location.href = 'detail.co';
}

// 뮤지컬 누르면 화면 뜨게
document.addEventListener('DOMContentLoaded', function() {
  console.log("페이지 로드 완료");
  
  let category = "classic"; // 원하는 카테고리를 여기에 넣으세요
  let url = `main.co?category=${category}`;


  // 버튼 클릭 이벤트 처리
  let musical = document.querySelector('.concert-ul').children[0];
  musical.addEventListener('click', function() {
      console.log("버튼 클릭됨");
      // 페이지 로드 함수 호출
      loadPage(url); // 로드할 페이지 URL을 넣으세요
  });
});

// 페이지 로드 함수 정의
function loadPage(url) {
  console.log("페이지 로드 시작: " + url);
  window.location.href = url; // 페이지 로드
}