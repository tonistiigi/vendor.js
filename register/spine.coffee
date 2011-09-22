
spine =
  getLatest : (cb) ->
    resolveFiles [
      ["spine.js", "http://maccman.github.com/spine/spine.js"]
      ], cb