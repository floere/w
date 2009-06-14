// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

splitPages = function() {
  first = $('.page');
  nav   = $('.chapternav li:last');
  
  chapters = $.trim($('.page .text').html()).split("\n");
  
  links    = $.map(chapters, function(chapter, number) {
    number = number + 1;
    return '<li><a href="#chapter' + number + '">' + number + '</a></li>';
  }).reverse();
  chapters = $.map(chapters, function(chapter, number) {
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
};