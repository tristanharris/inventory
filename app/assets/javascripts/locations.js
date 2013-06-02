$(function() {
  $('#location_page.editable').on('click', '[location]', function(e) {
    e.preventDefault()
    select_location($(this));
  });

  $('#location_page.editable').on('click', '.edit_item input[type=submit]', function(e) {
    $('#item_location').attr('value', $('#location').attr('value') + ':' + $('#shelf').val());
  });

  $('[location]').each(function(a, el) {
    var t = document.createElementNS("http://www.w3.org/2000/svg", "text");
    var b = el.getBBox();
    t.setAttribute("transform", "translate(" + (b.x + 5) + " " + (b.y + 20) + ")");
    t.textContent = $(el).attr('location');
    $(el).after(t);
  });

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
