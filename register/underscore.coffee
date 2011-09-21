
underscore =
  getLatest : (cb) ->
    resolveFiles [
      ["underscore.js", "http://documentcloud.github.com/underscore/underscore.js"]
      ], cb