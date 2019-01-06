$(document).on 'turbolinks:load', ->
    $("#myTable").tablesorter(
      widgets: ["filter"]
    );