// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function Options() {
  var optionsHidden = true;
  var pullOut       = $('#pullout');
  var hideTimer     = $.timer(2000, function(timer) {
    hide();
    timer.stop();
  });
  hideTimer.stop();
  
  function show() {
    pullOut.animate({right:'+=100'}, 100, 'easeOutQuad'); optionsHidden = !optionsHidden;
  };
  function hide() {
    pullOut.animate({right:'-=100'}, 200, 'easeOutQuad'); optionsHidden = !optionsHidden;
  };
  
  this.hide = function() {
    if (!optionsHidden) { hideTimer.stop(); hide(); return false; };
  };
  this.click = function() {
    if (optionsHidden) {
      show();
    } else {
      hideTimer.reset(2000);
    }
  };
}

showOptions = function() {
  var options = $('#options');
  // options.move
};
hideOptions = function() {
  var options = $('#options');
  // options.move
};

splitPages = function() {
  var first = $('.page .text').parent();
  var nav   = $('.chapternav li:last');
  
  var chapters = $.trim($('.page .text').html()).split("\n").filter(function(element) {
    return element.match(/^\s*$/) == null;
  });
  
  var links    = $.map(chapters, function(chapter, number) {
    number = number + 1;
    return '<li><a href="#chapter' + number + '">' + number + '</a></li>';
  }).reverse();
  var chapters = $.map(chapters, function(chapter, number) {
    number = number + 1;
    return '<div class="page" id="chapter' + number + '"><div class="chapter">' + number + '</div><div class="text">' + chapter + '</div></div><div class="shadow"></div>';
  }).reverse();
  
  $.each(chapters, function(number, page) {
    first.after(page);
  });
  $.each(links, function(number, page) {
    nav.after(page);
  });
  
  first.remove();
  $('ol.chapternav').localScroll({duration:250, easing:'easeOutExpo', offset:-10 });
  installScrollDetector();
};

// TODO Does not work since it is display none.
//      Do it by hand.
//
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
