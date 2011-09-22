
tiny =
  getLatest : (cb) ->
    resolveFiles [
      ["tiny.js", "http://tinyjs.sourceforge.net/tiny.js"]
      ], cb