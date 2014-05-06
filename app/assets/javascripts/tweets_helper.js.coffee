window.tweetsHelper =
  shareButton: (url) ->
    if twttr.widgets
      options = {
        hashtags: "LoxaDeAntaño",
        lang: "es",
        related: "cuxibamba",
        via: "cuxibamba",
        count: "vertical",
        text: ""
      }
      twttr.widgets.createShareButton url, document.getElementById("tweet-button"), {}, options
    else
      # wait until twttr is loaded
      setTimeout ->
        tweetsHelper.shareButton(url)
      , 500
