
sugar =
  getLatest : (cb) ->
    resolveFiles [
      ["sugar.js", "https://raw.github.com/andrewplummer/Sugar/master/lib/sugar.js"]
      ], cb