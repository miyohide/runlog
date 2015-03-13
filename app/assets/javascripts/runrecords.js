$(document).ready(function() {
  var ajaxDataRenderer = function(url, plot, options) {
    var ret = [[]];
    $.ajax({
      async: false,
      url: url,
      dataType: "json",
      success: function(data) {
        var len = data.length;
        for(var i = 0; i < len; i++) {
          ret[0].push([i, data[i].distance]);
        }
        console.log(ret);
      }
    });
    return ret;
  };

  var jsonurl = "http://localhost:3000/runrecords.json";

  var plot2 = $.jqplot('chartdiv', jsonurl, {
    title: "AJAX JSON Data Renderer",
    dataRenderer: ajaxDataRenderer,
    dataRendererOptions: {
      unusedOptionalUrl: jsonurl
    }
  });
});

