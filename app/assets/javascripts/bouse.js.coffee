$ ->
  $(".categories").on 'ajax:complete', 'a.jq_category_link', (event, data, status, xhr) ->
    if status == 'error'
      console.log('i am an error')
    else
      $('.categories > .category').removeClass 'active'
      $(this).parent().addClass 'active'
      $('#bodyer').html data.responseText
      history.pushState null, null, $(this).attr('href')

  $('.jq_search_field').on 'ajax:complete', 'form', (event, data, status, xhr) ->
    if status == 'error'
      console.log('searching => error')
    else
      $('.categories > .category').removeClass 'active'
      $('#bodyer').html data.responseText
      history.pushState null, null, $(this).attr('href')

  # $(window).scroll ->
  #   url = $('.pagination .next a').attr('href')
  #   if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
  #     $.get url, (data) ->
  #       $('.pagination').remove()
  #       $("#bodyer").append(data)
  #       history.pushState null, null, url