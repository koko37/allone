class Phenomena.Views.ProjectExpenseTabView extends Phenomena.View
  template: HoganTemplates["projects/expense"]
  
  initialize: (options)->
    @project = options.project
    
  render: ->
    $(@el).html(@template.render({
    
    },{}))
    
    @
