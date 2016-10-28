var hefesto = hefesto || {};

hefesto.calendar = (function() {
  'use strict';

  function bindHoCreate() {
    $('.simple-calendar .calendar-add-ho').on('click', function(e) {
      e.preventDefault();

      var myDate = $(this).data('date');
      $('#home_office_date').val(myDate);
      $('#create-ho-modal .ho-modal-date').text(revertDate(myDate));
    });
  }

  function bindHoDestroy() {
    $('.simple-calendar .calendar-del-ho').on('click', function(e) {
      e.preventDefault();

      var myDate = $(this).data('date');
      var modal = $('#destroy-ho-modal');
      $('#home_office_date').val(myDate);
      modal.find('.ho-modal-date').text(revertDate(myDate));
      modal.find('form').attr('action', $(this).data('action'));
    });
  }

  function revertDate(d) {
    return d.split('-').reverse().join('/');
  }

  function init() {
    bindHoCreate();
    bindHoDestroy();
  }

  return {
    init: init
  };
}());

$(document).ready(hefesto.calendar.init);
