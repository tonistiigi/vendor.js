
viper =
  getLatest : (cb) ->
    resolveFiles [
      ["viper.js", "https://raw.github.com/alpha123/Viper/master/src/viper-uncompressed.js"]
      ], cb