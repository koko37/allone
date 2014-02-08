class Phenomena.Views.ProjectSummaryView extends Phenomena.View
  template: HoganTemplates["projects/summary"]
  
  initialize: (options)->
    @project= options.project
    @project_tasks = options.project_tasks
    
  render: ->
    $(@el).html(@template.render({
    
    },{}))
    
    @
