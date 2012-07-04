$ ->
  $container = $("#ib-container")
  $articles = $container.children("article")
  timeout = undefined
  $articles.on "mouseenter", (event) ->
    $article = $(this)
    clearTimeout timeout
    timeout = setTimeout(->
      return false  if $article.hasClass("active")
      $articles.not($article.removeClass("blur").addClass("active")).removeClass("active").addClass "blur"
    , 65)

  $container.on "mouseleave", (event) ->
    clearTimeout timeout
    $articles.removeClass "active blur"