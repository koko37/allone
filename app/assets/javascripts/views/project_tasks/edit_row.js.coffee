class Phenomena.Views.ProjectTaskEditRowView extends Phenomena.View
  template: HoganTemplates["project_tasks/edit_row"]
  tagName: 'tr'
  
  initialize: (options)->
    @project_task = options.project_task

  render: ->
    $(@el).html(@template.render({
      
    },{}))
    
    @
    
  showForm: ->
    $(@el).find('td').removeClass('hide')
    
  hideForm: ->
    $(@el).find('td').addClass('hide')
