class Phenomena.Views.ProjectCostingTabView extends Phenomena.View
  template: HoganTemplates["projects/costing"]
  
  initialize: (options)->
    @project = options.project
    
  render: ->
    $(@el).html(@template.render({
    
    },{}))
    
    @
