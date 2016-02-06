Meteor.methods
	searchProducts: (term) ->
		check(term, String);
		searchResults = ReactionCore.Collections.Products.find({title: {$regex : ".*#{term}.*", $options: "i"}}, {fields: {_id: 1, title: 1, variants: 1}})
		autocompleteList = []

		searchResults.forEach ((product) ->
			listItem =
				value: product.title
				id: product._id
				price: product.variants[0].price
			this.push(listItem)
		), autocompleteList

		return autocompleteList
