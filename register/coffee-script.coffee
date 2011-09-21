
coffescript =
  getLatest : (cb) ->
    resolveFiles [
      ["coffee-script.js", "hhttp://jashkenas.github.com/coffee-script/extras/coffee-script.js"]
      ], cb