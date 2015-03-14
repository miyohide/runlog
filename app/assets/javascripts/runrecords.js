$(document).ready(function() {
  var plot_data = [[]];
  for(var i = 0; i < gon.runrecords.length; i++ ) {
    plot_data[0].push(gon.runrecords[i].distance);
  }
  $.jqplot("chartdiv", plot_data);
});

