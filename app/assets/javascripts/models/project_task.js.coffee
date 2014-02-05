class Phenomena.Models.ProjectTask extends Backbone.Model
  url: '/project_tasks'
  
  schema:
    task_id: { title: "Task", type: 'Select', options: []}
    labor_cost: { title: "Labor Cost" }
    material_cost: { title: "Material Cost" }
    unit_retail: { title: "Unit Retail" }
    quantity: { title: "Quantity" }
    period: { title: "Period" }
    
  profit: ->
    @get('unit_retail') - @get('labor_cost') - @get('material_cost')
    
  margin: ->
    Math.round( 100 * @profit() / @get('unit_retail'))
