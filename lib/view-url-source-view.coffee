{EditorView, View} = require 'atom'
http = require 'http'

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
      @urlEditor.focus()

  viewUrlSource: ->
    @find(".viewUrlSourceForm").hide()
    @find(".loading").show()
    link = @urlEditor.getText()
    
    req = http.get(link, (res) ->
      # output response body
      res.setEncoding "utf8"
      res.on "data", (str) ->
        console.log str
        return

      return
    )

    # error handler
    req.on "error", (err) ->
      console.log "Error: " + err.message
      return
