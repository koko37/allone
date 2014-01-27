class Phenomena.Views.TaskShowView extends Phenomena.View
  template: HoganTemplates["tasks/show"]
  tagName: 'tr'
  
  initialize: ->
    _.bindAll(this, 'render')
    
  render: ->
    $(@el).html(@template.render({
      description: @model.get('description'),
      labor_cost: @model.get('labor_cost'),
      material_cost: @model.get('material_cost'),
      unit_retail: @model.get('unit_retail')
    }, {}))
    
    @
