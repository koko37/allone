class Phenomena.Views.ProjectCostingTabView extends Phenomena.View
  template: HoganTemplates["projects/costing"]
  
  initialize: (options)->
    _.bindAll(this,'render')
    @project = options.project
    
  render: ->
    current_view = @
    $(@el).html(@template.render({
    
    },{}))

    _(@project.get("project_tasks")).each (project_task) ->
      project_task_view = new Phenomena.Views.ProjectTaskCostingRowView({project_task: project_task})
      current_view.appendChildTo(project_task_view,$(current_view.el).find('#costing_project_tasks_body'))
    @
