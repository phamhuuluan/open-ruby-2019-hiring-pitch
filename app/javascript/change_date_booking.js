$(document).on('change', '#booking_day', function() {
  var pitch_id = $('#booking_pitch_id').val();
  $.ajax({
    url : "/change_date_booking/" + pitch_id,
    type : "get",
    dataType: "script",
    data : {
      datetime : $('#booking_day').val(),
    }
  });
});
