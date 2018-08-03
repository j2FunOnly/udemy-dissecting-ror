setPositions = ->
  $('.card').map((i, el) ->
    {
      id: el.parentElement.dataset.id
      position: i + 1
    }
  ).get()

ready = ->
  $('.sortable').sortable().bind 'sortupdate', ->
    $.ajax {
      url: '/portfolios/positions'
      method: 'PUT'
      dataType: 'json'
      data: {
        positions: setPositions()
      }
      success: (resp) ->
        console.log(resp)
    }

$(document).on 'turbolinks:load', ready
