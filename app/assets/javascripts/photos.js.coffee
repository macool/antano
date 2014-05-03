# reduce opacity of non-hovered images
mouseEntered = -> $(".photo-thumbnails").addClass "hovered"
mouseLeft = -> $(".photo-thumbnails").removeClass "hovered"

imagesSelector = ".photo-thumbnail"

$(document).on "mouseenter", imagesSelector, mouseEntered
$(document).on "mouseleave", imagesSelector, mouseLeft
