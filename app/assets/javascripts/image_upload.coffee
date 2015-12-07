ready = ->
  $("#photo_image").fileupload
    dataType: "script"
    add:  (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $("#photo_image").append(data.context)
      data.submit()
    progress: (e, data) ->
      document.d = data
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.progress-bar-success').css('width', progress + "%")
    stop: (e, data) ->
      $('.upload').hide()

destroy_plugin = ->
  $('#photo_image').fileupload('destroy')

$(document).on 'page:change', ready
$(document).on 'page:before-change', destroy_plugin
