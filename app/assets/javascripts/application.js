
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .


$('#rental-start-date, #rental-end-date').change(function(event) {
  alert("Hi there!")
  var end_date = $('#rental-end-date').val();
  var start_date = $('#rental-start-date').val();
  var start_date_arr = start_date.split('-');
  var start = new Date(start_date_arr[0], parseInt(start_date_arr[1]) - 1, start_date_arr[2]);
  var end_date_arr = end_date.split('-');
  var end = new Date(end_date_arr[0], parseInt(end_date_arr[1]) - 1, end_date_arr[2]);
  var days = (end - start) / (1000*60*60*24) + 1;
  var daily_price = $('#total-cost').data('price');
  if (days < 1) {
    event.preventDefault();
    alert('Error! Please make sure your end date is after your start date.');
    $('#total-cost').text('ERROR: Please make sure your end date is after your start date.');
  } else {
    // $('#total-cost').text(`¥ ${daily_price} * ${days} day${days > 1 ? 's' : ''} = ¥ ${daily_price * days}`);
  }
});
