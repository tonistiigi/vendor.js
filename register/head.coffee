
head =
  getLatest : (cb) ->
    resolveFiles [
      ["head.js", "https://raw.github.com/headjs/headjs/master/dist/head.js"]
      ], cb