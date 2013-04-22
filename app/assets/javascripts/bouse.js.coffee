$ ->
  postManager = new PostManager('.js-posts', '.js-focus')
  postManager.bindPostClick()
  
  $(".categories").on 'ajax:complete', 'a.jq_category_link', (event, data, status, xhr) ->
    if status == 'error'
      console.log('i am an error')
    else
      $('.categories > .category').removeClass 'active'
      $(this).parent().addClass 'active'
      $('.js-category').html data.responseText
      $('.js-focus').empty()
      postManager.loadPostLinks()

      history.pushState null, null, $(this).attr('href')

  $('.jq_search_field').on 'ajax:complete', 'form', (event, data, status, xhr) ->
    if status == 'error'
      console.log('searching => error')
    else
      $('.categories > .category').removeClass 'active'
      $('.js-posts').html data.responseText
      $('.js-focus').empty()
      postManager.loadPostLinks()
      url = $(this).attr('action')+"?search="+$(this).find('input#search').val()

      history.pushState null, null, url
  

  # $(window).scroll ->
  #   url = $('.pagination .next a').attr('href')
  #   if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
  #     $.get url, (data) ->
  #       $('.pagination').remove()
  #       $("#bodyer").append(data)
  #       history.pushState null, null, url