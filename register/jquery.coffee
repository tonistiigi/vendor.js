
jquery =
  getLatest : (cb) ->
    resolveFiles [
      ["jquery.js", "http://code.jquery.com/jquery.js"]
      ], cb