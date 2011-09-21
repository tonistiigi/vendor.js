
visualsearch =
  getLatest : (cb) ->
    resolveFiles [
      ["visualsearch.js", "http://documentcloud.github.com/visualsearch/build/visualsearch.js"]
      ], cb