
benchmark =
  getLatest : (cb) ->
    resolveFiles [
      ["benchmark.js", "https://raw.github.com/bestiejs/benchmark.js/master/benchmark.js"]
      ], cb