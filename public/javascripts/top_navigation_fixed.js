$(document).ready(function(){
  var $top1= $('.top_navigation_fixed').offset().top + 100;
  $(window).scroll(function(){
    if ($(window).scrollTop()>$top1){
      $('.top_navigation_fixed').hide();
      $('.top_navigation_fixed').show();
      $('.fixed_navigation').addClass('open');
    }else{
      $('.fixed_navigation').removeClass('open');
      $('.top_navigation_fixed').hide();
    }
  });
});