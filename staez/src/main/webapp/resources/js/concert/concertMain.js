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
