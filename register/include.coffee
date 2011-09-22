
include =
  getLatest : (cb) ->
    resolveFiles [
      ["include.js", "https://raw.github.com/CapMousse/Include.js/master/include.js"]
      ], cb