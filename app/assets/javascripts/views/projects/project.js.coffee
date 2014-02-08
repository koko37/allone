class Phenomena.Views.ProjectDetailView extends Phenomena.View

  initialize: (options) ->
    _.bindAll(this,'render')

    @all_views = options.children
    
  render: ->
    current_view = @
    _(@all_views).each (child_view) ->
      current_view.appendChild(child_view)

    @

