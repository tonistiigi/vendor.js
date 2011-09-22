
resolvePrototype = (cb) -> 
  request "http://www.prototypejs.org/download", (err, resp, body) ->
    throw err if err
    match = body.match /https:\/\/ajax\.googleapis\.com\/ajax\/libs\/prototype\/([\.0-9]+)\/prototype\.js/
    resolveFiles [
      ["prototype.js", match[0]]
      ], cb
      
prototype =
  getLatest : (cb) ->
    resolvePrototype cb