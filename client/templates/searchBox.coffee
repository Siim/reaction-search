Template.searchBox.rendered = () ->

	$("#searchBox").autocomplete(
    minLength: 1
		source: (request, response) ->
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
$("#searchBoxDate").autocomplete(
	minLength: 1
	source: (request, response) ->
		Meteor.call "searchProductsByDate", request.date, (error, result) ->
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
