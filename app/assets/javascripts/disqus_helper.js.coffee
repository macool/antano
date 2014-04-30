window.disqusHelper =
  loaded: false

  load: (@identifier) ->
    if @loaded
      @resetDisqus()
    else
      @loadDisqus()

  resetDisqus: ->
    identifier = @identifier
    DISQUS.reset
      reload: true,
      config: ->
        @page.identifier = identifier
        @page.url = window.location.href

  loadDisqus: ->
    @loaded = true
    disqus_shortname = "antano"
    disqus_identifier = @identifier
    # disqus script from https://antano.disqus.com/admin/settings/universalcode/:
    $dsq = $ "<script />", type: "text/javascript", async: true, src: "//#{disqus_shortname}.disqus.com/embed.js"
    $("body").append($dsq)
