
store =
  getLatest : (cb) ->
    resolveFiles [
      ["store.js", "https://raw.github.com/marcuswestin/store.js/master/store.js"]
      ], cb