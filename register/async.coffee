
async =
  getLatest : (cb) ->
    resolveFiles [
      ["async.js", "https://raw.github.com/caolan/async/master/dist/async.min.js"]
      ], cb