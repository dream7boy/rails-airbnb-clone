
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .


$('#rental-start-date, #rental-end-date').change(function(event) {
  const end_date = $('#rental-end-date').val();
  const start_date = $('#rental-start-date').val();
  const start_date_arr = start_date.split('-');
  const start = new Date(start_date_arr[0], parseInt(start_date_arr[1]) - 1, start_date_arr[2]);
  const end_date_arr = end_date.split('-');
  const end = new Date(end_date_arr[0], parseInt(end_date_arr[1]) - 1, end_date_arr[2]);
  const days = (end - start) / (1000*60*60*24) + 1;
  const daily_price = $('#total-cost').data('price');
  if (days < 1) {
    event.preventDefault();
    alert('Error! Please make sure your end date is after your start date.');
    $('#total-cost').text('ERROR: Please make sure your end date is after your start date.');
  } else {
    $('#total-cost').text(`¥ ${daily_price} * ${days} day${days > 1 ? 's' : ''} = ¥ ${daily_price * days}`);
  }
});

$('#my-pets').hide();
$('#my-bookings-tab').addClass("active");

$('#my-pets-tab').click(function(event) {
  $('#my-bookings-tab').removeClass("active");
  $('#my-bookings').hide();
  $('#my-pets').show();
  $('#my-pets-tab').addClass("active");
});

$('#my-bookings-tab').click(function(event) {
  $('#my-pets-tab').removeClass("active");
  $('#my-pets').hide();
  $('#my-bookings').show();
  $('#my-bookings-tab').addClass("active");
});
