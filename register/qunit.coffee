
qunit =
  getLatest : (cb) ->
    loadjs.resolveFiles [
      ["qunit.js", "http://code.jquery.com/qunit/qunit-git.js"]
      ["qunit.css", "http://code.jquery.com/qunit/qunit-git.css"]
      ], cb