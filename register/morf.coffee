
morf =
  getLatest : (cb) ->
    resolveFiles [
      ["morf.js", "https://raw.github.com/joelambert/morf/master/js/morf.js"]
      ], cb