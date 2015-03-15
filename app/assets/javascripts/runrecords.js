$(document).ready(function() {
  var plot_data = [];
  for(var i = 0; i < gon.runrecords.length; i++ ) {
    plot_data.push([gon.runrecords[i].runned_at, gon.runrecords[i].distance]);
  }
  $.jqplot("chartdiv", [plot_data], {
    title: "Run Log",
    series:[{renderer:$.jqplot.BarRenderer}],
    axesDefaults: {
      tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
      tickOptions: {
        angle: -30,
        fontSize: '10pt'
      }
    },
    axes: {
      xaxis: {
        renderer: $.jqplot.CategoryAxisRenderer
      }
    }
  });
});

