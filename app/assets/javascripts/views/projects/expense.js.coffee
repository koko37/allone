class Phenomena.Views.ProjectExpenseTabView extends Phenomena.View
  template: HoganTemplates["projects/expense"]
  
  initialize: (options)->
    @project = options.project
    @project_tasks = options.project_tasks
    @listenTo(@project_tasks, 'change', @render)
    @listenTo(@project_tasks, 'remove', @render)
    
  render: ->
    $(@el).html(@template.render({
    
    },{}))
    
    $(@el).find('.graph_view').html(@project_tasks.price())
    @
