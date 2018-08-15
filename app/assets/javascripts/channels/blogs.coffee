$(document).on 'turbolinks:load', ->
  $comments = $('#comments')

  if $comments.length > 0
    App.globalChat = App.cable.subscriptions.create {
      channel: 'BlogsChannel'
      blog_id: $comments.data('blog-id')
    }, {
      connected: ->
      disconnected: ->
      received: (data) ->
        $comments.append data['comment']
      send_comment: (comment, blog_id) ->
        @perform 'send_comment', comment: comment, blog_id: blog_id
    }

  $('#new_comment').submit (e) ->
    $textarea = $(this).find('#comment_content')

    if $textarea.val().trim().length > 1
      App.globalChat.send_comment $textarea.val().trim(),
        $comments.data('blog-id')
      $textarea.val('')

    e.preventDefault()
    return false
