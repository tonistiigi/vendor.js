
require =
  getLatest : (cb) ->
    resolveFiles [
      ["require.js", "https://raw.github.com/jrburke/requirejs/master/require.js"]
      ], cb