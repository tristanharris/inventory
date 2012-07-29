$('#location_page.editable [owner=district] [location]').live('click', function(e) {
  e.preventDefault()
  select_location($(this));
});

$('#location_page.editable .edit_item input[type=submit]').live('click', function(e) {
  $('#item_location').attr('value', $('#location').attr('value') + ':' + $('#shelf').val());
});

$(function() {
  var parts = $('#item_location').attr('value').split(':');
  select_location($('[location='+parts[0]+']'));
  $('#shelf').attr('value', parts[1]);
});

function update_shelf(loc) {
  var selected = $('#shelf').val();
  $('#shelf').empty();
  for (i=1; i<=loc.attr('shelves'); i++) {
    $('#shelf').prepend($('<option></option>').attr("value", i).text(i));
  }
  $('#shelf').val(selected);
}

function select_location(loc) {
  $('#location').attr('value', loc.attr('location'));
  $('svg [selected]').removeAttr('selected');
  loc.attr('selected', 'true');
  update_shelf(loc);
}
