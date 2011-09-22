
dateutils =
  getLatest : (cb) ->
    resolveFiles [
      ["date-utils.js", "https://raw.github.com/JerrySievert/node-date-utils/master/lib/date-utils.js"]
      ], cb