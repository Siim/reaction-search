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
	searchProductsByDate: (date) ->
		check(date, String);

		isoDate = new Date(date)

		ReactionCore.Log.info("searching prods with date: ", isoDate);
		searchResults = ReactionCore.Collections.Products.find({forSaleOnDate: isoDate}, {fields: {_id: 1, title: 1, variants: 1}}) # {$regex : ".*#{date}.*", $options: "i"}
		autocompleteList = []
		#ReactionCore.Log.info("searchResults: ", searchResults);

		searchResults.forEach ((product) ->
			ReactionCore.Log.info("prod found for date: ", product.title);
			listItem =
				value: product.title
				id: product._id
				price: product.variants[0].price
			this.push(listItem)
		), autocompleteList

		return autocompleteList
