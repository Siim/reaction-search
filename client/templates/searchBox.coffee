Template.searchBox.rendered = () ->

	$("#searchBox").autocomplete(
    minLength: 3
		source: (request, response) ->
			console.log "search term "+request.term
			Meteor.call "searchProducts", request.term, (error, result) ->
        console.log error if error
        if result
          response result
  ).data("ui-autocomplete")._renderItem = (ul, item) ->

    listItemHtml = """
                    <a href="/product/#{item.id}"> #{item.value}
                      <span class="search-item-price">
                        $#{item.price}
                      </span>
                    </a>
                   """
    return  $( "<li>" ).html(listItemHtml).appendTo( ul )

  $('#searchBoxDate').datepicker();

	$("#searchBoxDate").autocomplete(
		minLength: 8
		source: (request, response) ->
			console.log "search date "+new Date(request.term)
			#ReactionCore.Log.error("Failed to add to cart.", request);

			# parse to date on server side, cause the the timezone matches the db
			Meteor.call "searchProductsByDate", request.term, (error, result) ->
				console.log error if error
				if result
					response result
	).data("ui-autocomplete")._renderItem = (ul, item) ->

		listItemHtml = """
										<a href="/product/#{item.id}"> #{item.value}
											<span class="search-item-price">
												$#{item.price}
											</span>
										</a>
									 """
		return  $( "<li>" ).html(listItemHtml).appendTo( ul )
