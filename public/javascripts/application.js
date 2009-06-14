// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

splitPages = function() {
  var first = $('.page');
  var nav   = $('.chapternav li:last');
  
  var chapters = $.trim($('.page .text').html()).split("\n");
  
  var links    = $.map(chapters, function(chapter, number) {
    number = number + 1;
    return '<li><a href="#chapter' + number + '">' + number + '</a></li>';
  }).reverse();
  var chapters = $.map(chapters, function(chapter, number) {
    number = number + 1;
    return '<div class="page" id="chapter' + number + '"><div class="chapter">' + number + '</div><div class="text">' + chapter + '</div></div>';
  }).reverse();
  
  $.each(chapters, function(number, page) {
    first.after(page);
  });
  $.each(links, function(number, page) {
    nav.after(page);
  });
  
  first.remove();
  installScrollDetector();
};

installScrollDetector = function() {
  $(window).scroll(function (evt) {
    var chapters = $('.page .chapter');
    var visibles = $.grep(chapters, function(chapter) {
      return $.inviewport(chapter, { threshold: 0 });
    });
    var current = $('.chapternav li.current');
    var visible = $(visibles[0]).html();
    if (current.html() != visible) {
      current.html(visible);
    }
  });
};
