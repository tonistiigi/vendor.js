
json2 =
  getLatest : (cb) ->
    resolveFiles [
      ["json2.js", "https://raw.github.com/douglascrockford/JSON-js/master/json2.js"]
      ], cb