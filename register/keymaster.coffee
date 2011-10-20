
keymaster =
  getLatest : (cb) ->
    resolveFiles [
      ["keymaster.js", "https://raw.github.com/madrobby/keymaster/master/keymaster.js"]
      ], cb