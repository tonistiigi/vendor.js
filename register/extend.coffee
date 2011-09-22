
extend =
  getLatest : (cb) ->
    resolveFiles [
      ["extend.js", "https://raw.github.com/searls/extend.js/master/src/extend.js"]
      ], cb