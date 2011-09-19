
underscore =
  getLatest : (cb) ->
    loadjs.resolveFiles [
      ["underscore.js", "http://documentcloud.github.com/underscore/underscore.js"]
      ], cb