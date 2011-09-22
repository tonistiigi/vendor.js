
slang =
  getLatest : (cb) ->
    resolveFiles [
      ["slang.js", "https://raw.github.com/devongovett/slang/master/slang.js"]
      ], cb