class Phenomena.Views.ProjectCostingTabView extends Phenomena.View
  template: HoganTemplates["projects/costing"]
  
  initialize: (options)->
    _.bindAll(this,'render')
    @project = options.project
   
    # parse project_tasks nested objects into collection
    @project_tasks = new Phenomena.Collections.ProjectTasks()      
    @project_tasks.reset(@project.get("project_tasks"))

    @project_tasks.on('add', @render)
    
    # get template tasks list
    @template_tasks = new Phenomena.Collections.Tasks()
    @template_tasks.fetch()

  events:
    'click #add_new_project_task': 'add_new_project_task'
    
  render: ->
    current_view = @
    $(@el).html(@template.render({
    
    },{}))

    @project_tasks.each (project_task) ->
      project_task_view = new Phenomena.Views.ProjectTaskCostingRowView({project_task: project_task})
      project_task_edit_view = new Phenomena.Views.ProjectTaskEditRowView({
        project_task: project_task
        template_tasks: current_view.template_tasks
      })
      
      project_task_view.edit_row_view = project_task_edit_view
      
      current_view.appendChildTo(project_task_view,$(current_view.el).find('#costing_project_tasks_body'))
      current_view.appendChildTo(project_task_edit_view,$(current_view.el).find('#costing_project_tasks_body'))
    @
    
  add_new_project_task: (e)->
    e.preventDefault()
    console.log "add new project task"
    
    project_task = new Phenomena.Models.ProjectTask()
    @project_tasks.push(project_task)
