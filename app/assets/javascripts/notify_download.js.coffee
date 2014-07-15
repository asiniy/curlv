$ ->
  faye = new Faye.Client('http://localhost:9292/faye')
  faye.subscribe '/downloads/status_message', (data) ->
    $('#' + data.id).html(data.message)
