# open links on another domain in a new tab

currentDomain = window.location.href.split("/")[2]

$(document).on "click", "a", (e) ->
  unless @href.split("/")[2] == currentDomain
    protocol = @href.split("/")[0]
    if protocol is "http:" or protocol is "https:"
      window.open @href
      false
