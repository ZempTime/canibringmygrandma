ready = ->
  $('[type=file]').fileupload
    add: (e, data) ->
      $.getJSON '/photos/images/cache/presign', (result) ->
        data.formData = result['fields']
        data.url = result['url']
        data.submit()
        return
      return
    done: (e, data) ->
      image =
        id: data.formData.key.match(/\w+$/)[0]
        storage: 'cache'
        metadata:
          size: data.files[0].size
          filename: data.files[0].name
          mime_type: data.files[0].type
      $.ajax('/photos/',
        method: 'POST'
        data: photo: image: JSON.stringify(image)).done (data) ->
        $('#image-preview').append data
        return
      return
  return

destroy_plugin = ->
  $('#photo_image').fileupload('destroy')

$(document).on 'page:change', ready
$(document).on 'page:before-change', destroy_plugin
