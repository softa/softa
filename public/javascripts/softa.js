$("img[id!='back_to_top']").lazyload({ placeholder: "/images/spaceball.gif", effect: "fadeIn"});

$('form#contact_us').submit(function(){

  if( ! $('#contact_us_name').val() ){
    $('#contact_us_name').focus()
    $('#contact_us_name_required').slideDown()
    return false
  }else{
    $('#contact_us_name_required').slideUp()
  }
  email_re = /^[a-z0-9\._-]+@([a-z0-9][a-z0-9-_]*[a-z0-9-_]\.)+([a-z-_]+\.)?([a-z-_]+)$/
  if( ! $('#contact_us_email').val() ){
    $('#contact_us_email').focus()
    $('#contact_us_email_required').slideDown()
    return false
  }else if( ! $('#contact_us_email').val().match(email_re) ){
    $('#contact_us_email').focus()
    $('#contact_us_email_required').slideUp()
    $('#contact_us_email_invalid').slideDown()
    return false
  }else{
    $('#contact_us_email_required').slideUp()
    $('#contact_us_email_invalid').slideUp()
  }

  if( ! $('#contact_us_message').val() ){
    $('#contact_us_message').focus()
    $('#contact_us_message_required').slideDown()
    return false
  }else{
    $('#contact_us_message_required').slideUp()
  }

  var data = $(this).serialize()
  $(this).find('input, textarea, button').attr('disabled', true)
  var url = $(this).attr('action')
  $.post(url, data, function(result){
    //$('#send_button').attr('disabled', true)
    $('#contact_us').find('input, textarea, button').attr('disabled', false)
    if(result['ok']){
      $('#contact_us').find('input, textarea').val('')
      $('#contact_us_content').fadeOut()
      $('#contact_us_success').fadeIn()
    }else{
      $('#contact_us_content').fadeOut()
      $('#contact_us_failure').fadeIn()
    }
  }, 'json')
  return false
})

$('.send_another').click(function(){
  $('#contact_us_success').hide()
  $('#contact_us_failure').hide()
  $('#contact_us_content').fadeIn()
  $('#contact_us_name').focus()
  return false
})

var $top1= $('#softa_description').offset().top + 100;
$(window).scroll(function(){
  $(window).scrollTop() > $top1 ? $('#back_to_top').show('fast') : $('#back_to_top').hide('fast')
})

$("a[href^='#']").click(function(){
  href = $(this).attr('href')
  pos = $(href).position()
  pos.top -= 40
  $.scrollTo(pos,600)
  if(href == '#contact_us') $('#contact_us_name').focus()
  if(href == '#top') change_emphasis(emphasis, 0)
  return false
})
emphasis = [".web_two",".ruby_on_rails",".postgresql",".open_source",".methods"]
next_emphasis = null
function change_emphasis(emphasis, index){
  if(index > 0)
    $(emphasis[index - 1]).removeClass('active').addClass('passed')
  else{
    clearTimeout(next_emphasis)
    $(emphasis).each(function(i,v){ $(v).removeClass('passed').removeClass('active') })
  }
  if(index == emphasis.length) return
  $(emphasis[index]).addClass('active')
  next_emphasis = setTimeout(function(){ change_emphasis(emphasis, index + 1) }, 2000)
}
change_emphasis(emphasis, 0)
