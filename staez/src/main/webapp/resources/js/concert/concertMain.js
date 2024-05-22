// function slide() {
//   $('.concert-main-upper').slick({
//       slidesToShow: 5,
//       slidesToScroll: 1,
//       autoplay: true,
//       autoplaySpeed: 2000,
//       infinite: true,  // 오타 수정: isfinite -> infinite
//       nextArrow: $('.next'),
//       prevArrow: $('.prev'),
//       centerMode: true
//   });
// }

$(document).ready(function(){
  $('.concert-main-upper').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
      prevArrow: $('.concert-main-upper-next'),
      nextArrow: $('.concert-main-upper-next')
  });
});

