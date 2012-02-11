
stats =
  getLatest : (cb) ->
    resolveFiles [
      ["stats.js", "https://raw.github.com/mrdoob/stats.js/master/src/Stats.js"]
      ], cb