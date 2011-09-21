fs = require "fs"
path = require "path"
coffee = require "coffee-script"
request = require "request"
require "bufferjs"
async = require "async"
{_} = require "underscore"
require "colors"

resolveFiles = (urls, cb) ->
  files = []
  async.forEach urls, ([name, url], cb) ->
    buffers = []
    r = request url
    r.on "data", (data) -> buffers.push data
    r.on "end", ->
      files.push [name, Buffer.concat buffers]
      cb()
  , -> cb files

_ls = (param, cb) ->
  async.map [(path.resolve __dirname, "../register/"), "."], fs.readdir, (err, files) ->
    results = []
    for register in files[0]
      register = register.replace /\.coffee$/, ""
      continue if param.length and register not in param
      isvalid = (name) -> name.match new RegExp "^#{register}\.", "i"
      if _.any files[1], isvalid
        results.push name: register, files: _.filter files[1], isvalid
    cb results


        
ls = (param) ->
  _ls param, (results) ->
    for {name, files} in results
      console.log "#{name.bold}: #{files}"

_get_remote = (name, cb) ->
  filename = path.resolve __dirname, "../register/#{name}.coffee"
  path.exists filename, (exists) ->
    if exists
      fs.readFile filename, (err, data) ->
        throw err if err
        asset = coffee.eval data.toString('utf8'), sandbox: 
          resolveFiles: resolveFiles
          console: console
        asset.getLatest cb
    else
      console.log "No package #{name} found."

_buffers_equal = (b1, b2) ->
  return false if b1.length != b2.length
  for b, i in b1
    return false if b != b2[i]
  true

_status = (param, cb) ->
  results = []
  _ls param, (list) ->
    async.forEach list, ({name, files}, cb) ->
      fdata = []
      results.push name: name, files: fdata
      _get_remote name, (files) ->
        async.forEach files, ([fname, data], cb) ->
          res = name: fname, remotedata: data.length, localdata: [], changed: true
          fdata.push res
          path.exists fname, (exists) ->
            return cb() unless exists
            fs.readFile fname, (err, localdata) ->
              return cb() if err
              res.localdata = localdata.length
              res.changed = false if _buffers_equal data, localdata
              cb()
        ,
        -> cb()
    , 
    -> cb results

status = (param) ->
  _status param, (results) ->
    console.log JSON.stringify results
    
pull = (names) ->
  throw "You have to specify a name for pull command." unless names.length
  for name in names
    _get_remote name, (files) ->
      _.each files, ([file, data]) -> 
          fs.writeFile file, data, (err) ->
            throw err if err
            console.log "Loaded file #{file}"

      
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
    vendor ls [name]      - list assets loaded in current dir
    vendor pull name      - download asset
    vendor status [name]  - check if there are updates
    vendor diff name      - diff current version with latest possible
  """

root = module.exports =
  run : run
  help : help
  resolveFiles : resolveFiles