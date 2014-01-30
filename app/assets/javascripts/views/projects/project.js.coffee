class Phenomena.Views.ProjectDetailView extends Phenomena.View

  initialize: (options) ->
    _.bindAll(this,'render')

    @headerView= options.header_view
    @tabView = options.tab_view
    
  render: ->
    @appendChild(@headerView)
    @appendChild(@tabView)
    @

