Router.map(function() {
  return this.route('searchBox', {
    controller: ShopAdminController,
    path: 'searchbox',
    template: 'searchBox',
    waitOn: function() {
      return PackagesHandle;
    }
  });
});

// ---
// generated by coffee-script 1.9.2
