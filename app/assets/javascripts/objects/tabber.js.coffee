class @Tabber
  constructor: (@selector, @informationSelector) ->
    
  show: ->
    @tabs = @startElement().tabs @loadConfig()
  
  loadConfig: ->
    config = 
      selected: parseInt(@informationElement().attr "data-selected-tab")
  
  startElement: ->
    $(@selector)
  
  informationElement: ->
    $(@informationSelector)