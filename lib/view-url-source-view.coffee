{EditorView, View} = require 'atom'

module.exports =
class ViewUrlSourceView extends View
  @content: ->
    @div class: 'view-url-source overlay from-top', =>
      @div class: 'viewUrlSourceForm', =>
        @div class: 'block', =>
          @label 'You might want to type URL here.'
          @div =>
            @subview 'urlEditor', new EditorView(mini: true, placeholderText: 'You typed URL...')

        @div class: 'block', =>
          @button click: "viewUrlSource", class: 'btn', 'View it'

      @span class: 'loading loading-spinner-large', style: "display:none;"


  initialize: (serializeState) ->
    atom.workspaceView.command "view-url-source:toggle", => @toggle()

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)

  viewUrlSource: ->
    @find(".viewUrlSourceForm").hide()
    @find(".loading").show()
    url = @urlEditor.getText()
