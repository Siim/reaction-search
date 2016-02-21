Package.describe({
  summary: "Reaction Search - Search Feature For Your Reaction Shop"
});

Package.on_use(function (api, where) {

  api.use([
    "templating",
    "coffeescript",
    //"iron:router",
    "check",
    "jquery",
    "less",
    "reactioncommerce:core",
    "scydev:reaction-p2p-marketplace-sell-date",
    "rajit:bootstrap3-datepicker"
  ], ["client", "server"]);

  api.add_files([
    //"common/register.js"
  ],["client","server"]);

  api.add_files([
    //"client/routing.js",
    "client/templates/searchBox.html",
    "client/templates/searchBox.less",
    "client/templates/searchBox.js"
  ], ["client"]);

  api.add_files([
    "server/methods.js"
  ], ["server"]);

});
