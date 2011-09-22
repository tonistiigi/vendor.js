
weld =
  getLatest : (cb) ->
    resolveFiles [
      ["weld.js", "https://raw.github.com/hij1nx/weld/master/lib/weld.js"]
      ], cb