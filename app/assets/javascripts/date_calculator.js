// date_calculator.js

$('#rental-start-date, #rental-end-date').change(function(event) {
  const end_date = $('#rental-end-date').val();
  const start_date = $('#rental-start-date').val();
  const [year_start, month_start, day_start] = start_date.split('-');
  const start = new Date(year_start, parseInt(month_start) - 1, day_start);
  const [year_end, month_end, day_end] = end_date.split('-');
  const end = new Date(year_end, parseInt(month_end) - 1, day_end);
  const days = (end - start) / (1000*60*60*24) + 1;
  const daily_price = $('#total-cost').data('price');
  if (days < 1) {
    event.preventDefault();
    alert('Error! Please make sure your end date is after your start date.');
    $('#total-cost').text(`ERROR: Please make sure your end date is after your start date.`);
  } else {
    $('#total-cost').text(`¥ ${daily_price} * ${days} day${days > 1 ? 's' : ''} = ¥ ${daily_price * days}`);
  }
});
