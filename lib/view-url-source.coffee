ViewUrlSourceView = require './view-url-source-view'

module.exports =
  viewUrlSourceView: null

  activate: (state) ->
    @viewUrlSourceView = new ViewUrlSourceView(state.viewUrlSourceViewState)
