$(document).on "click", ".photo-suggestion-more-info", ->
  $this = $(this)
  $context = $this.parent().parent()
  if $this.hasClass "shown" # hide
    $this.removeClass "shown"
    $this.html "más ▾"
    $context.find(".not-shown").slideUp()
  else # show
    $this.addClass "shown"
    $this.html "menos ▴"
    $context.find(".not-shown").slideDown()
  false

$(document).on "click", ".cancel-photo-suggestion-editing", ->
  $form = $(this).closest("form")
  $form.prev().show()
  $form.remove()
  false
