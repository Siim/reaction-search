Package.describe({
  summary: "Reaction Search - Search Feature For Your Reaction Shop"
});

Package.on_use(function (api, where) {

  api.use([
    "templating",
    "coffeescript",
    //"iron:router",
    "jquery",
    "less",
    "reactioncommerce:core",
    "scydev:reaction-p2p-marketplace-sell-date",
    "rajit:bootstrap3-datepicker"
  ], ["client", "server"]);

  api.add_files([
    //"common/register.coffee"
  ],["client","server"]);

  api.add_files([
    //"client/routing.coffee",
    "client/templates/searchBox.html",
    "client/templates/searchBox.less",
    "client/templates/searchBox.js"
  ], ["client"]);

  api.add_files([
    "server/methods.coffee"
  ], ["server"]);

});
