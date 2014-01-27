class Phenomena.Views.TasksIndexView extends Phenomena.View
  template: HoganTemplates["tasks/index"]
  
  initialize: ->
    console.log("d")
    _.bindAll(this, 'render')
  
  render: ->
    console.log("e")
    $(@el).html(@template.render({},{}))
    console.log("f")
    current_view = this

    
    _(@collection.models).each (model) ->
      view = Phenomena.Views.TaskShowView({ model: model})
      current_view.appendChildTo(view, current_view.$('#tasks_body'))
      
    @
