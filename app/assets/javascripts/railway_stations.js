$(document).ready(function() {
  $('a.edit_station').click(function(e) {
    e.preventDefault();
    var stationId;
    var form;
    var title;

    stationId = $(this).data('stationId');
    form = $('#edit_railway_station_' + stationId);
    title = $('#railway_station_title_' + stationId)

    if (!$(this).hasClass('cancel')) {
      $(this).html('Cancel').addClass('cancel');
    } else {
      $(this).html('Edit').removeClass('cancel');
    }
    form.toggle();
    title.toggle();
  });
});
