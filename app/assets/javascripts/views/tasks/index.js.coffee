class Phenomena.Views.TasksIndexView extends Phenomena.View
  template: HoganTemplates["tasks/index"]
  
  initialize: ->
    _.bindAll(this, 'render')
  
  render: ->
    $(@el).html(@template.render({},{}))
    current_view = this
    
    @collection.each (model) ->
      view = new Phenomena.Views.TaskShowView({ model: model})
      current_view.appendChildTo(view, current_view.$('#tasks_body'))
      
      form_view = new Phenomena.Views.TaskFormShowView({ model: model})
      current_view.appendChildTo(form_view, current_view.$('#tasks_body'))
      
      view.edit_form_instance = form_view
    @
