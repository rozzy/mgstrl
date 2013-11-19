function setupHeader () {
  $('header.top_menu').width($('.content').width() + 34);
}

$(function () {
  $(window).bind('resize ready', setupHeader);
  setupHeader();
});