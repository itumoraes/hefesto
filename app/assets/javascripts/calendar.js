$('.simple-calendar .day').on('click', function() {
  $('#home_office_date').val($(this).data('date'));
});
