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

  $('#technologies').on
    'cocoon:before-insert': (e, el) -> el.css(display: 'none')
    'cocoon:after-insert': (e, el) -> el.fadeIn(200)
    'cocoon:before-remove': (e, el) ->
      $(this).data('remove-timeout', 200)
      el.fadeOut(200)

$(document).on 'turbolinks:load', ready
