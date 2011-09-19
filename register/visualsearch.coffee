
visualsearch =
  getLatest : (cb) ->
    loadjs.resolveFiles [
      ["visualsearch.js", "http://documentcloud.github.com/visualsearch/build/visualsearch.js"]
      ], cb