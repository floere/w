jQuery.fn.smartArea = function() {
  
  return this.each(function() {
  if (!jQuery(this).is("textarea")) {
    return false;
  }
  
  jQuery(this).click( function() {
    jQuery.SA.resizeArea( this );
  }).keyup(function(){
    jQuery.SA.resizeArea( this ); } );
    return this;
  });

}

jQuery.SA = {
  resizeArea : function ( t ) {
    
    var lines = t.value.split('\n') || [];
    var newRows = lines.length;
    var oldRows = t.rows;
    for (var i = 0; i < lines.length; i++) {
      var line = lines[i];
      if (line.length >= t.cols) newRows += Math.floor(line.length / t.cols);
    }
    if (newRows > t.rows) t.rows = newRows;
    if (newRows < t.rows) t.rows = Math.max(1, newRows);
  }
}