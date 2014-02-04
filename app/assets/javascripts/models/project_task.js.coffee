class Phenomena.Models.ProjectTask extends Backbone.Model
  schema:
    description: { title: "Description" }
    labor_cost: { title: "Labor Cost" }
    material_cost: { title: "Material Cost" }
    unit_retail: { title: "Unit Retail" }
    period: { title: "Period" }
    
  profit: ->
    @get('unit_retail') - @get('labor_cost') - @get('material_cost')
    
  margin: ->
    Math.round( 100 * @profit() / @get('unit_retail'))
