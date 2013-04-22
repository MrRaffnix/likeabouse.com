class @PostManager

  constructor: (@selector, @focusSelector) ->
    @loadPostLinks()

  bindPostClick: ->
    postManager = this
    @disableAreaLink()
    @element().on 'ajax:complete', '.jq_open_post', (event, data, status, xhr) ->
      if status == 'error'
        console.log('an error occured')
      else
        for link in postManager.postLinks
          $(link).removeClass('in-focus')

        $(this).parents('.jq_post_box').addClass('in-focus')
        postManager.focusPost(data.responseText, $(this).attr('href'))

  loadPostLinks: ->
    @postLinks = @element().find('.jq_post_box')

  reload: ->
    for link in @postLinks
      $(link).removeClass('in-focus')
    @focusArea().empty()
    @loadPostLinks()
    

  focusPost: (content, link) ->
    @focusArea().html(content)
    history.pushState null, null, link
    $("html, body").stop(true, true).animate
        scrollTop: @focusArea().offset().top - 150
      , 1000

  disableAreaLink: ->
    @element().on 'click', '.jq_focus a', (event) ->
      event.preventDefault()

  element: ->
    $(@selector)

  focusArea: ->
    $(@focusSelector)