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
$("a[href^='#']").click(function(){
  href = $(this).attr('href')
  pos = $(href).position()
  pos.top -= 40
  $.scrollTo(pos,600)
  return false
})
var emphasis = [".web_two",".ruby_on_rails",".postgresql",".open_source",".methods"]
function change_emphasis(emphasis, index)
{
  if(index > 0)
    $(emphasis[index - 1]).removeClass('active').addClass('passed')
  if(index == emphasis.length)
  {
    return
  }
  else
  {
    $(emphasis[index]).addClass('active')
    setTimeout("change_emphasis(emphasis, " + (index + 1) + ")", 2000)
  }
}
change_emphasis(emphasis, 0)
