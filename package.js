Package.describe({
  summary: "Reaction Search - Search Feature For Your Reaction Shop",
  name: "reactioncommerce:reaction-search",
  version: "0.2.0",
  documentation: "README.md"
});

Package.onUse(function (api, where) {
  api.versionsFrom("METEOR@1.2.1");
  api.use([
    "blaze-html-templates",
    "ecmascript",
    "check",
    "jquery",
    "less",
    "reactioncommerce:core@0.12.0",
    "rajit:bootstrap3-datepicker@1.5.1"
  ]);

  api.addFiles([
    //"common/register.js"
  ],["client","server"]);

  api.addFiles([
    //"client/routing.js",
    "client/templates/searchBox.html",
    "client/templates/searchBox.less",
    "client/templates/searchBox.js"
  ], ["client"]);

  api.addFiles([
    "server/methods.js"
  ], ["server"]);

});
