$(document).ready(function() {
  $('.search_form').submit(function() {
    var startStation;
    var endStation;
    
    startStation = $(this).find('#search_start_station_id');
    endStation = $(this).find('#search_end_station_id');
    if (startStation.val() === endStation.val()) {
     alert('choose end station');
     return false;
    }
  });
});
