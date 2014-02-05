class Phenomena.Views.ProjectTaskCostingRowView extends Phenomena.View
  template: HoganTemplates["project_tasks/costing_row"]
  tagName: "tr"
  edit_row_view: ''
  
  initialize: (options)->
    @project_task = options.project_task
    # @project_task.on('change', @render)

  events:
    'click a.open-costing-task-input' : 'open_edit_form'
    'click a.close-costing-task-input' : 'close_edit_form'
    
  render: ->
    $(@el).html(@template.render({
      description: @project_task.get("description")
      labor_cost: @project_task.get("labor_cost")
      material_cost: @project_task.get("material_cost")
      unit_retail: @project_task.get("unit_retail")
      period: @project_task.get("period")
      profit: @project_task.profit()
      margin: @project_task.margin()
    },{}))

    @
    
  open_edit_form: (e)->
    e.preventDefault()
    
    # default state of open/close folder icon
    $('.open-costing-task-input').removeClass('hide')
    $('.close-costing-task-input').addClass('hide')

    # on/off folder icon
    $(@el).find('.open-costing-task-input').addClass('hide')
    $(@el).find('.close-costing-task-input').removeClass('hide')

    console.log "open form"
    @edit_row_view.showForm()

    
  close_edit_form: (e)->
    e.preventDefault()

    # on/off folder icon
    $(@el).find('.open-costing-task-input').removeClass('hide')
    $(@el).find('.close-costing-task-input').addClass('hide')

    console.log "close form"
    @edit_row_view.hideForm()
