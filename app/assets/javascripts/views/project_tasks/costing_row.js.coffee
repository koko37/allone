class Phenomena.Views.ProjectTaskCostingRowView extends Phenomena.View
  template: HoganTemplates["project_tasks/costing_row"]
  tagName: "tr"
  
  initialize: ->
  
  render: ->
    $(@el).html(@template.render({
      description: "description"
      labor_cost: "1"
      material_cost: "2"
      unit_retail: "3"
      profit: "4"
      margin: "5"
    },{}))
    
    @
