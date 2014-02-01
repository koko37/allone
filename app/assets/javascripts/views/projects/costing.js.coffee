class Phenomena.Views.ProjectCostingTabView extends Phenomena.View
  template: HoganTemplates["projects/costing"]
  
  initialize: (options)->
    @project = options.project
    console.log @project
    
  render: ->
    $(@el).html(@template.render({
    
    },{}))
    
    project_task_view = new Phenomena.Views.ProjectTaskCostingRowView({})
    @appendChildTo(project_task_view,$(@el).find('#costing_project_tasks_body'))

    project_task_view1 = new Phenomena.Views.ProjectTaskCostingRowView({})
    @appendChildTo(project_task_view1,$(@el).find('#costing_project_tasks_body'))

    project_task_view2 = new Phenomena.Views.ProjectTaskCostingRowView({})
    @appendChildTo(project_task_view2,$(@el).find('#costing_project_tasks_body'))

    @
