(function() {
  var diff, help, ls, pull, run, status;
  var __slice = Array.prototype.slice;
  ls = function(param) {
    throw "Diff not implemented";
  };
  status = function(param) {
    throw "status not implemented";
  };
  pull = function(param) {
    throw "pull not implemented";
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
  help = function() {
    return console.log("Usage: \n  loadjs ls [name]      - list assets loaded in current dir\n  loadjs pull name      - download asset\n  loadjs status [name]  - check if there are updates\n  loadjs diff name      - diff current version with latest possible");
  };
  module.exports = {
    run: run,
    help: help
  };
}).call(this);
