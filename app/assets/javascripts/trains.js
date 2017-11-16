$(document).ready(function() {
  $('a.edit_train').click(function(e) {
    e.preventDefault();
    var trainId;
    var trainForm;
    var trainNumberTitle;

    trainId = $(this).data('trainId');
    trainForm = $('#edit_train_' + trainId);
    trainNumberTitle = $('#train_number' + trainId);

    if (!$(this).hasClass('cancel')) {
      $(this).html('Cancel').addClass('cancel');
    } else {
      $(this).html('Edit').removeClass('cancel');
    }
    trainForm.toggle();
    trainNumberTitle.toggle();
  });
});
