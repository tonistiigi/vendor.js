fs = require "fs"
path = require "path"
coffee = require "coffee-script"

_queue = (arr, iterator, callback) ->
  return callback() unless arr.length
  iterator arr[0], ->
    _queue arr[1..], iterator, callback

resolveFiles = (urls, cb) ->
  cb urls

ls = (param) ->
  throw "Diff not implemented"

status = (param) ->
  throw "status not implemented"

pull = (names) ->
  throw "You have to specify a name for pull command." unless names.length
  for name in names
    filename = path.resolve __dirname, "../register/#{name}.coffee"
    path.exists filename, (exists) ->
      if exists
        fs.readFile filename, (err, data) ->
          throw err if err
          module = coffee.eval data.toString('utf8'), sandbox: loadjs: root
          module.getLatest (files) ->
            console.log files
      else
        console.log "No package #{name} found."
      
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

help = (e) -> console.log """
  Usage: 
    loadjs ls [name]      - list assets loaded in current dir
    loadjs pull name      - download asset
    loadjs status [name]  - check if there are updates
    loadjs diff name      - diff current version with latest possible
  """

root = module.exports =
  run : run
  help : help
  resolveFiles : resolveFiles