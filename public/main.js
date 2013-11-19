function setupHeader () {
  var selector = $('.content').size() > 0 ? $('.content') : $('.wrapper:last');
  $('header.top_menu').width(selector.width() + 34);
}

$(function () {
  $(window).bind('resize ready', setupHeader);
  setupHeader();
});