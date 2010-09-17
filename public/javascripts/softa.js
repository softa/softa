$('img').lazyload({ placeholder: "/images/spaceball.gif", effect: "fadeIn"});

$('form#contact_us').submit(function(){

  if( ! $('#contact_us_name').val() ){
    $('#contact_us_name').focus()
    $('#contact_us_name_required').slideDown()
    return false
  }
  if( ! $('#contact_us_email').val() ){
    $('#contact_us_email').focus()
    $('#contact_us_email_required').slideDown()
    return false
  }
  email_re = /^[a-z0-9\._-]+@([a-z0-9][a-z0-9-_]*[a-z0-9-_]\.)+([a-z-_]+\.)?([a-z-_]+)$/
  if( ! $('#contact_us_email').val().match(email_re) ){
    $('#contact_us_email').focus()
    $('#contact_us_email_invalid').slideDown()
    return false
  }
  if( ! $('#contact_us_message').val() ){
    $('#contact_us_message').focus()
    $('#contact_us_message_required').slideDown()
    return false
  }

  var data = $(this).serialize()
  var url = $(this).attr('action')
  $.post(url, data, function(result){
	if(result['ok'])
	  alert('Ok. pensar na mensagem aqui LT.')
	else
	  alert('Error. pensar na mensagem aqui LT.')
  }, 'json')
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
