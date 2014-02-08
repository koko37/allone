class Phenomena.Views.ProjectCostingTabView extends Phenomena.View
  template: HoganTemplates["projects/costing"]
  
  initialize: (options)->
    _.bindAll(this,'render')
    @project = options.project
   
    # parse project_tasks nested objects into collection
    @project_tasks = new Phenomena.Collections.ProjectTasks()      
    @project_tasks.reset(@project.get("project_tasks"))

    @project_tasks.on('add', @render)
    @listenTo(@project_tasks,'change', @render_total_calculate)
    @listenTo(@project_tasks,'destroy', @render_total_calculate)
    
    # get template tasks list
    @template_tasks = options.template_tasks

  events:
    'click #add_new_project_task': 'add_new_project_task'
  
  render_total_calculate: ->
    $(@el).find('.total_price_of_project').html(@project_tasks.price())
    $(@el).find('.total_profit_of_project').html(@project_tasks.profit())
    $(@el).find('.total_margin_of_project').html(@project_tasks.margin())
    
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
    
    #calculate total info of tasks
    @render_total_calculate()
    
    @
    
  add_new_project_task: (e)->
    e.preventDefault()
   
    new_task = new Phenomena.Models.ProjectTask()
    new_task.set({
      project_id: @project.id
    })

    current_view = @    
    new_task.save({}, {
      success: (model, response, options)->
        current_view.project_tasks.push(model)
    })


