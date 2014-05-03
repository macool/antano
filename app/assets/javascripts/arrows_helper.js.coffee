# left and right arrow
$(document).on "keydown", (e) ->
  if e.keyCode is 37
    $node = $(".siblings_buttons .glyphicon-chevron-left")
  if e.keyCode is 39
    $node = $(".siblings_buttons .glyphicon-chevron-right")
  if $node and $node[0]
    Turbolinks.visit $node.attr("href")
