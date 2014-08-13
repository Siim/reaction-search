Package.describe({
  summary: "Reaction Search - Search Feature For Your Reaction Shop"
});

Package.on_use(function (api, where) {

  api.use([
    "templating",
    "coffeescript",
    "iron-router",
    "less",
    "reaction-core"
  ], ["client", "server"]);

  api.add_files([
    "common/register.coffee"
  ],["client","server"]);

  api.add_files([
    "client/routing.coffee",
    "client/templates/searchBox.html",
    "client/templates/searchBox.less",
    "client/templates/searchBox.coffee"
  ], ["client"]);

  api.add_files([
    "server/methods.coffee"
  ], ["server"]);

});