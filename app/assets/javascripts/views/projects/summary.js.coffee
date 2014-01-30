class Phenomena.Views.ProjectSummaryView extends Phenomena.View
  template: HoganTemplates["projects/summary"]
  
  initialize: (options)->
    @project= options.project
  
  render: ->
    $(@el).html(@template.render({
    
    },{}))
    
    @
