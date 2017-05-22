window.App ={}

App.loader = {}

App.back = ->
  window.history.back()
  false

App.loader.show = ->
  $('#app-loader').show()

App.loader.hide = ->
  $('#app-loader').hide()

$(document).on 'turbolinks:request-start', App.loader.show
$(document).on 'turbolinks:load', App.loader.hide

setTimeout (->
  $('#flash_message').html ''
  return
), 5000
