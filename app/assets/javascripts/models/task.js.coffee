class Phenomena.Models.Task extends Backbone.Model
  urlRoot: '/tasks'
  
  schema: 
    description: {title: "Description"}
    labor_cost: {title: "Labor Cost"}
    material_cost: {title: "Material Cost"}
    unit_retail: {title: "Retail Cost"}
    
  validate: (attrs, options) ->
    false
    #if (attrs.labor_cost <0 || !attrs.labor_cost)
    #  return "Labor Cost should be positive"
    #if (attrs.material_cost <0 || !attrs.material_cost)
    #  return "Material Cost should not be negative"
    #if (attrs.unit_retail < (attrs.labor_cost + attrs.material) || !attrs.unit_retail)
    #  return "Unit Retail price should be higher than expenses"
