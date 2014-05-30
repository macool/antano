init_tooltips = ->
  $("[data-toggle='tooltip']").tooltip()

$(document).on "ready", init_tooltips
$(document).on "page:change", init_tooltips
