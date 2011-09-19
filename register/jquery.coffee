
jquery =
  getLatest : (cb) ->
    loadjs.resolveFiles [
      ["jquery.js", "http://code.jquery.com/jquery.js"]
      ], cb