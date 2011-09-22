
mustache =
  getLatest : (cb) ->
    resolveFiles [
      ["mustache.js", "https://raw.github.com/janl/mustache.js/master/mustache.js"]
      ], cb