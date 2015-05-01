$(".runrecords_index").ready(function() {
  var distance_data = [];
  var pace_data = [];

  for(var i = 0; i < gon.runrecords.length; i++ ) {
    distance_data.push([gon.runrecords[i].runned_at, gon.runrecords[i].distance]);
  }

  for(var i = 0; i < gon.pace_records.length; i++ ) {
    pace_data.push([gon.pace_records[i].runned_at, gon.pace_records[i].pace]);
  }

  $.jqplot("chartdiv", [distance_data, pace_data], {
    title: "Run Log",
    series:[{renderer:$.jqplot.BarRenderer}, {xaxis:"xaxis", yaxis:"y2axis"}],
    axesDefaults: {
      tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
      tickOptions: {
        angle: -80,
        fontSize: '10pt'
      }
    },
    axes: {
      xaxis: {
        renderer: $.jqplot.CategoryAxisRenderer
      },
      yaxis: {
        label: "distance",
        min: 0,
        max: 50,
        pad: 10,
        numberTicks: 11,
        tickOptions: {
          angle: 0
        }
      },
      y2axis: {
        min: 100,
        max: 400,
        tickOptions: {
          angle: 0
        }
      }
    }
  });
});

