$('img').lazyload({ placeholder: "/images/spaceball.gif", effect: "fadeIn"});
var $top1= $('#softa_description').offset().top + 100;
$(window).scroll(function(){
  if ($(window).scrollTop()>$top1){
    $('#back_to_top').show('fast');
  }else{
    $('#back_to_top').hide('fast');
  }
});
$("a[href^='#']").click(function(){
  href = $(this).attr('href')
  pos = $(href).position()
  pos.top -= 40
  $.scrollTo(pos,600)
  if(href == '#contact_us')
    $('#contact_us_name').focus()
  return false
})
var emphasis = [".web_two",".ruby_on_rails",".postgresql",".open_source",".methods"]
function change_emphasis(emphasis, index){
  if(index > 0)
    $(emphasis[index - 1]).removeClass('active').addClass('passed')
  if(index == emphasis.length){
    return
  }else{
    $(emphasis[index]).addClass('active')
    setTimeout("change_emphasis(emphasis, " + (index + 1) + ")", 2000)
  }
}
change_emphasis(emphasis, 0)