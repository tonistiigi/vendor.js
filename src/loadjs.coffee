fs = require "fs"
path = require "path"
coffee = require "coffee-script"
request = require "request"
require "bufferjs"
async = require "async"

resolveFiles = (urls, cb) ->
  files = {}
  async.forEach urls, ([name, url], cb) ->
    buffers = []
    r = request url
    r.on "data", (data) -> buffers.push data
    r.on "end", ->
      files[name] = Buffer.concat buffers
      cb()
  , -> cb files

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
          asset = coffee.eval data.toString('utf8'), sandbox: 
            loadjs: root
            console: console
          asset.getLatest (files) ->
            for own file, data of files
              do (file,data) -> 
                fs.writeFile file, data, (err) ->
                  throw err if err
                  console.log "Loaded file #{file}"
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