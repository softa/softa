$(function(){
    $.get('http://blog.softa.com.br/rss.xml', {}, function(data, status){ console.warn(status); });
});
