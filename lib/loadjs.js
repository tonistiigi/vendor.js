(function() {
  var coffee, diff, fs, help, ls, path, pull, resolveFiles, root, run, status, _queue;
  var __slice = Array.prototype.slice;
  fs = require("fs");
  path = require("path");
  coffee = require("coffee-script");
  _queue = function(arr, iterator, callback) {
    if (!arr.length) {
      return callback();
    }
    return iterator(arr[0], function() {
      return _queue(arr.slice(1), iterator, callback);
    });
  };
  resolveFiles = function(urls, cb) {
    return cb(urls);
  };
  ls = function(param) {
    throw "Diff not implemented";
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
            var module;
            if (err) {
              throw err;
            }
            module = coffee.eval(data.toString('utf8'), {
              sandbox: {
                loadjs: root
              }
            });
            return module.getLatest(function(files) {
              return console.log(files);
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
