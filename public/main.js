function setupHeader () {
  var selector = $('.content').size() > 0 ? $('.content') : $('.wrapper:last');
  $('header.top_menu').width(selector.width() + 34);
}

$(function () {
  if ($('.mpgtitle').size() > 0) $('title').text($('title').text() + ' | ' + $('.mpgtitle').text());
  $(window).bind('resize ready', setupHeader);
  setupHeader();
  $('.map.closed').attr('class', 'map hood closed');
  $('.togglemap').click(function () {
    $('.map.opened').animate({height: 100}, function () {$(this).attr('class', 'map hood closed')});
    $('.map.opened .togglemap').fadeIn();
    $(this).parent().animate({height: $(this).next().find('img').data('h') ? $(this).next().find('img').data('h') : 300}, function () {$(this).attr('class', 'map hood opened')});
    $(this).fadeOut();
    return false;
  });
});