function setupHeader () {
  var selector = $('.content').size() > 0 ? $('.content') : $('.wrapper:last');
  $('header.top_menu').width(selector.width() + 34);
}

$(function () {
  $(window).bind('resize ready', setupHeader);
  setupHeader();
  $('.togglemap').click(function () {
    $(this).parent().animate({height: 300});
    $(this).remove();
    return false;
  });
  if ($('.bxslider').size() > 0) $('.bxslider').bxSlider({adaptiveHeight: true, prevText: '←', nextText: '→'});
});