
yepnope =
  getLatest : (cb) ->
    resolveFiles [
      ["yepnope.js", "https://raw.github.com/SlexAxton/yepnope.js/master/yepnope.js"]
      ], cb