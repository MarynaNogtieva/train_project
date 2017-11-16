function loadCarTypeForm(carTypeValue){
  const carBottomSeats = $('.car-bottom-seats');
  const carTopSeats = $('.car-top-seats');
  const carTopSideSeats = $('.car-top-side-seats');
  const carBottomSideSeats = $('.car-bottom-side-seats');
  const carSeatedSeats = $('.car-seated-seats');
  switch(carTypeValue){
    case 'SeatedCar':
      carSeatedSeats.show();
      carBottomSideSeats.hide();
      carTopSideSeats.hide();
      carBottomSeats.hide();
      carTopSeats.hide();
    break;
    case 'SvCar':
      carSeatedSeats.hide();
      carBottomSideSeats.hide();
      carTopSideSeats.hide();
      carBottomSeats.show();
      carTopSeats.hide();
    break;
    case 'EconomCar':
      carSeatedSeats.hide();
      carBottomSideSeats.show();
      carTopSideSeats.show();
      carBottomSeats.show();
      carTopSeats.show();
    break;
    case 'BusinessCar':
      carSeatedSeats.hide();
      carBottomSideSeats.hide();
      carTopSideSeats.hide();
      carBottomSeats.show();
      carTopSeats.show();
    break;
    default:
    break;
  }
}

$(document).ready(function() {
  let carTypeValue = $('#car_type').val();
  loadCarTypeForm(carTypeValue)
  $('#car_type').change(function() {
    loadCarTypeForm($(this).val());
  });
});