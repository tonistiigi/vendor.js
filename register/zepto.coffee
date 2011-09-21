request = require "request"
fs = require "fs"
zip = require "zip"
{Buffer} = require "buffer"
require "bufferjs"

getZepto = (cb) -> 
  request "http://zeptojs.com/", (err, resp, body) ->
    throw err if err
    match = body.match /(\/downloads\/zepto-([\.0-9]+).zip)">download package/
    buffers = []
    r = request("http://zeptojs.com#{match[1]}")
    r.on "data", (b) ->
      buffers.push b
    r.on "end", ->
      reader = zip.Reader Buffer.concat buffers
      files = reader.toObject 'utf-8'
      for own k,v of files
        return cb new Buffer(v) if k.match /dist\/zepto.js$/
      
zepto =
  getLatest : (cb) ->
    getZepto (data) ->
      cb [["zepto.js",data]]