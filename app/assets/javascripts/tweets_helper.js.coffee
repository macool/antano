window.tweetsHelper =
  publishedTweet: (id) ->
    if twttr.widgets
      twttr.widgets.createTweet id, document.getElementById("published-tweet"), align: "center"
    else
      # wait until twttr is loaded
      setTimeout ->
        tweetsHelper.publishedTweet(id)
      , 500
