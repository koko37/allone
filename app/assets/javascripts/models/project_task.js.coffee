class Phenomena.Models.ProjectTask extends Backbone.Model
  urlRoot: ()->
    '/projects/' + @get('project_id') + '/project_tasks'
  
  schema:
    task_id: { title: "Task", type: 'Select', options: []}
    labor_cost: { title: "Labor Cost" }
    material_cost: { title: "Material Cost" }
    unit_retail: { title: "Unit Retail" }
    quantity: { title: "Quantity" }
    period: { title: "Period" }
    
  cost: ->
    parseFloat(@get('labor_cost')) + parseFloat(@get('material_cost'))
    
  profit: ->
    Math.floor(parseFloat(@get('unit_retail')) - parseFloat(@get('labor_cost')) - parseFloat(@get('material_cost')))
    
  margin: ->
    Math.round( 100 * @profit() / parseFloat(@get('unit_retail')))
