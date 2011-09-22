
#for dist you may want to use modernizr builder instead
modernizr =
  getLatest : (cb) ->
    resolveFiles [
      ["modernizr.js", "http://www.modernizr.com/downloads/modernizr-latest.js"]
      ], cb