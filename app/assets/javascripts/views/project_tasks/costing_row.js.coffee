class Phenomena.Views.ProjectTaskCostingRowView extends Phenomena.View
  template: HoganTemplates["project_tasks/costing_row"]
  tagName: "tr"
  
  initialize: (options)->
    @project_task = new Phenomena.Models.ProjectTask()
    @project_task.set(options.project_task)
    
  render: ->
    $(@el).html(@template.render({
      description: @project_task.get("description")
      labor_cost: @project_task.get("labor_cost")
      material_cost: @project_task.get("material_cost")
      unit_retail: @project_task.get("unit_retail")
      profit: "4"
      margin: "5"
    },{}))
    
    @
