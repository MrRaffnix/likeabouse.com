$ ->
  $(".categories").on 'ajax:complete', 'a.jq_category_link', (event, data, status, xhr) ->
    if status == 'error'
      console.log('i am an error')
    else
      $('.categories > .category').removeClass 'active'
      $(this).parent().addClass 'active'
      $('#bodyer').html data.responseText

  $('.jq_search_field').on 'ajax:complete', 'form', (event, data, status, xhr) ->
    if status == 'error'
      console.log('searching => error')
    else
      $('.categories > .category').removeClass 'active'
      $('#bodyer').html data.responseText