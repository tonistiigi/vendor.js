
chosen =
  getLatest : (cb) ->
    loadjs.resolveFiles [
      ["chosen-sprite.png", "https://github.com/harvesthq/chosen/raw/master/chosen/chosen-sprite.png"]
      ["chosen.css", "https://raw.github.com/harvesthq/chosen/master/chosen/chosen.css"]
      ["chosen.jquery.js", "https://raw.github.com/harvesthq/chosen/master/chosen/chosen.jquery.js"]
      ["chosen.proto.js", "https://raw.github.com/harvesthq/chosen/master/chosen/chosen.proto.js"]
      ], cb