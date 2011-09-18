
backbone =
  getLatest : (cb) ->
    loadjs.resolveFiles
      "backbone.js" : "https://raw.github.com/documentcloud/backbone/master/backbone.js"
      , cb