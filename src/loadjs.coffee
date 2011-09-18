

run = (opts) ->
  console.log opts
  help()

help = -> console.log """
  Usage: 
    loadjs ls [name]    - list assets loaded in current dir
    loadjs get name     - download asset
    loadjs check [name] - check if there are updates
    loadjs diff name    - diff current version with latest possible
  """

module.exports =
  run : run
  help : help