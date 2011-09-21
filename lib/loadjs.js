(function() {
  var async, coffee, diff, fs, help, ls, path, pull, request, resolveFiles, root, run, status, _, _ls;
  var __indexOf = Array.prototype.indexOf || function(item) {
    for (var i = 0, l = this.length; i < l; i++) {
      if (this[i] === item) return i;
    }
    return -1;
  }, __hasProp = Object.prototype.hasOwnProperty, __slice = Array.prototype.slice;
  fs = require("fs");
  path = require("path");
  coffee = require("coffee-script");
  request = require("request");
  require("bufferjs");
  async = require("async");
  _ = require("underscore")._;
  resolveFiles = function(urls, cb) {
    var files;
    files = {};
    return async.forEach(urls, function(_arg, cb) {
      var buffers, name, r, url;
      name = _arg[0], url = _arg[1];
      buffers = [];
      r = request(url);
      r.on("data", function(data) {
        return buffers.push(data);
      });
      return r.on("end", function() {
        files[name] = Buffer.concat(buffers);
        return cb();
      });
    }, function() {
      return cb(files);
    });
  };
  _ls = function(param, cb) {
    return async.map([path.resolve(__dirname, "../register/"), "."], fs.readdir, function(err, files) {
      var isvalid, register, result, _i, _len, _ref;
      result = {};
      _ref = files[0];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        register = _ref[_i];
        register = register.replace(/\.coffee$/, "");
        if (param.length && __indexOf.call(param, register) < 0) {
          continue;
        }
        isvalid = function(name) {
          return name.match(new RegExp("^" + register + "\.", "i"));
        };
        if (_.any(files[1], isvalid)) {
          result[register] = _.filter(files[1], isvalid);
        }
      }
      return cb(result);
    });
  };
  ls = function(param) {
    return _ls(param, function(result) {
      var files, name, _results;
      _results = [];
      for (name in result) {
        if (!__hasProp.call(result, name)) continue;
        files = result[name];
        _results.push(console.log("" + name + ": " + files));
      }
      return _results;
    });
  };
  status = function(param) {
    throw "status not implemented";
  };
  pull = function(names) {
    var filename, name, _i, _len, _results;
    if (!names.length) {
      throw "You have to specify a name for pull command.";
    }
    _results = [];
    for (_i = 0, _len = names.length; _i < _len; _i++) {
      name = names[_i];
      filename = path.resolve(__dirname, "../register/" + name + ".coffee");
      _results.push(path.exists(filename, function(exists) {
        if (exists) {
          return fs.readFile(filename, function(err, data) {
            var asset;
            if (err) {
              throw err;
            }
            asset = coffee.eval(data.toString('utf8'), {
              sandbox: {
                loadjs: root,
                console: console
              }
            });
            return asset.getLatest(function(files) {
              var data, file, _results2;
              _results2 = [];
              for (file in files) {
                if (!__hasProp.call(files, file)) continue;
                data = files[file];
                _results2.push((function(file, data) {
                  return fs.writeFile(file, data, function(err) {
                    if (err) {
                      throw err;
                    }
                    return console.log("Loaded file " + file);
                  });
                })(file, data));
              }
              return _results2;
            });
          });
        } else {
          return console.log("No package " + name + " found.");
        }
      }));
    }
    return _results;
  };
  diff = function(param) {
    throw "diff not implemented";
  };
  run = function(opts) {
    var cmd, param;
    cmd = opts[0], param = 2 <= opts.length ? __slice.call(opts, 1) : [];
    try {
      switch (cmd) {
        case "ls":
          return ls(param);
        case "pull":
          return pull(param);
        case "status":
          return status(param);
        case "diff":
          return diff(param);
        case cmd:
          throw "No such command " + cmd;
          break;
        default:
          return help();
      }
    } catch (e) {
      console.log("Error: " + e);
      return help();
    }
  };
  help = function(e) {
    return console.log("Usage: \n  loadjs ls [name]      - list assets loaded in current dir\n  loadjs pull name      - download asset\n  loadjs status [name]  - check if there are updates\n  loadjs diff name      - diff current version with latest possible");
  };
  root = module.exports = {
    run: run,
    help: help,
    resolveFiles: resolveFiles
  };
}).call(this);
