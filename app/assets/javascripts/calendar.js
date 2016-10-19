var hefesto = hefesto || {};

hefesto.calendar = (function() {
  'use strict';

  function bindHoCreation() {
    $('.simple-calendar .day').on('click', function() {
      var myDate = $(this).data('date');
      $('#home_office_date').val(myDate);

      myDate = myDate.split('-').reverse().join('/');
      $('#ho-modal').find('.ho-modal-date').text(myDate);
    });
  }

  function init() {
    bindHoCreation();
  }

  return {
    init: init
  };
}());

$(document).ready(hefesto.calendar.init);
