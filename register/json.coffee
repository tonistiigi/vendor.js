
json =
  getLatest : (cb) ->
    resolveFiles [
      ["json.js", "https://raw.github.com/douglascrockford/JSON-js/master/json.js"]
      ], cb