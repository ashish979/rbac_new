$(document).on 'turbolinks:load', -> $('.datepicker').datetimepicker({
  useCurrent: false
  format: 'YYYY-MM-DD'
  maxDate: '2050-12-31'
});

$(document).on 'turbolinks:load', -> $('.timepicker').datetimepicker({
  useCurrent: false
  format: 'hh:mm A'
});

