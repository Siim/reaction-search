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
		check(date, Date);
		ReactionCore.Log.error("searching prods with date: ", date); # we seem to be losing a day here?!
		searchResults = ReactionCore.Collections.Products.find({forSaleOnDate: date}, {fields: {_id: 1, title: 1, variants: 1}}) # {$regex : ".*#{date}.*", $options: "i"}
		autocompleteList = []

		searchResults.forEach ((product) ->
			ReactionCore.Log.error("prod found for date: ", product.title);
			listItem =
				value: product.title
				id: product._id
				price: product.variants[0].price
			this.push(listItem)
		), autocompleteList

		return autocompleteList
