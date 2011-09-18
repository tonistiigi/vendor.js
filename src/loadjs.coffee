ls = (param) ->
  throw "Diff not implemented"

status = (param) ->
  throw "status not implemented"

pull = (param) ->
  throw "pull not implemented"

diff = (param) ->
  throw "diff not implemented"

run = (opts) ->
  [cmd, param...] = opts
  try 
  
    switch cmd
      when "ls" then ls param
      when "pull" then pull param
      when "status" then status param
      when "diff" then diff param
      when cmd then throw "No such command #{cmd}"
      else help() 
      
  catch e
    console.log "Error: #{e}"
    help()

help = -> console.log """
  Usage: 
    loadjs ls [name]      - list assets loaded in current dir
    loadjs pull name      - download asset
    loadjs status [name]  - check if there are updates
    loadjs diff name      - diff current version with latest possible
  """

module.exports =
  run : run
  help : help