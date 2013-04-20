class @PostManager

  constructor: (@selector, @focusSelector) ->
    @loadPostLinks()

  bindPostClick: ->
    postManager = this
    @element().on 'ajax:complete', '.jq-open-post', (event, data, status, xhr) ->
      if status == 'error'
        console.log('an error occured')
      else
        for link in postManager.postLinks
          $(link).removeClass('in-focus')

        $(this).parents('.jq-post-box').addClass('in-focus')
        postManager.focusPost(data.responseText)

  loadPostLinks: ->
    @postLinks = @element().find('.jq-post-box')

  focusPost: (content) ->
    @focusArea().html(content)
    $("html, body").stop(true, true).animate
        scrollTop: @focusArea().offset().top - 150
      , 1000

  element: ->
    $(@selector)

  focusArea: ->
    $(@focusSelector)