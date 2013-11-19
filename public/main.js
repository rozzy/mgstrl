function setupHeader () {
  var selector = $('.content').size() > 0 ? $('.content') : $('.wrapper:last');
  $('header.top_menu').width(selector.width() + 34);
}

$(function () {
  $(window).bind('resize ready', setupHeader);
  setupHeader();
  $('.map.closed').attr('class', 'map hood closed');
  $('.togglemap').click(function () {
    $('.map.opened').animate({height: 100}, function () {$(this).attr('class', 'map hood closed')});
    $('.map.opened .togglemap').fadeIn();
    $(this).parent().animate({height: 300}, function () {$(this).attr('class', 'map hood opened')});
    $(this).fadeOut();
    return false;
  });
  if ($('.bxslider').size() > 0) $('.bxslider').bxSlider({adaptiveHeight: true, prevText: '←', nextText: '→'});
});