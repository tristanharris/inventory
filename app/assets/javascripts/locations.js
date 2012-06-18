$('#location_edit [owner=district] [location]').live('click', function(e) {
  e.preventDefault()
  $('#location').attr('value', $(this).attr('location'));

  var selected = $('#shelf').val();
  $('#shelf').empty();
  for (i=1; i<=$(this).attr('shelves'); i++) {
    $('#shelf').prepend($('<option></option>').attr("value", i).text(i));
  }
  $('#shelf').val(selected);
});

$('#location_edit .edit_item input[type=submit]').live('click', function(e) {
  $('#item_location').attr('value', $('#location').attr('value') + ':' + $('#shelf').val());
});
