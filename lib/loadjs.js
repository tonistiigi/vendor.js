(function() {
  var help, run;
  run = function(opts) {
    console.log(opts);
    return help();
  };
  help = function() {
    return console.log("Usage: \n  loadjs ls [name]    - list assets loaded in current dir\n  loadjs get name     - download asset\n  loadjs check [name] - check if there are updates\n  loadjs diff name    - diff current version with latest possible");
  };
  module.exports = {
    run: run,
    help: help
  };
}).call(this);
