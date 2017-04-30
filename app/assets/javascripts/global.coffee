window.App ={}

App.back = ->
  window.history.back()
  false

setTimeout (->
  $('#flash_message').html ''
  return
), 5000