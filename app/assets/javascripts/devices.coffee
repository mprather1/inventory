#jQuery ->
#    availableTags = [@device.serial_numbers];
#    $( "#search-form" ).autocomplete(
#      source: availableTags
#    )
#jQuery ->
#  $('#search-form').autocomplete(
#    minLength: 2,
#    source: '<%= devices_path(:json) %>',
#
#    focus:(event, ui) ->
#      $('#search-form').val(@device.serial_number);
#      return false;
#  )
#  select: (event, ui) ->
#    $('#search-form').val(@device.serial_number);
#    $('#link_origin_id').val(@device.id);
#    return false;
#
#  data("autocomplete")._renderItem = (ul, item) ->
#    return $("<li></li>")
#      .data("item.autocomplete", item)
#      .append( "<a>" + @device.serial_number + "</a>")
#      .appendTo(ul);
