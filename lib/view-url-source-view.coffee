{View} = require 'atom'

module.exports =
class ViewUrlSourceView extends View
  @content: ->
    @div class: 'view-url-source overlay from-top', =>
      @div "The ViewUrlSource package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "view-url-source:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ViewUrlSourceView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
