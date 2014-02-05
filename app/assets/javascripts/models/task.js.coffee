class Phenomena.Models.Task extends Backbone.Model
  urlRoot: '/tasks'
  
  schema: 
    description: {title: "Description"}
    labor_cost: {title: "Labor Cost"}
    material_cost: {title: "Material Cost"}
    unit_retail: {title: "Retail Cost"}
    
  toString: ->
    @get('description')
