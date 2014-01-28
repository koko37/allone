class Phenomena.Views.TaskShowView extends Phenomena.View
  template: HoganTemplates["tasks/show"]
  tagName: 'tr'
  edit_form_instance: ''
    
  initialize: ->
    _.bindAll(this, 'render','updateValue')
    @model.on('change', @updateValue)
    
  events:
    'click .icon-folder-open': 'show_edit_form'
    'click .icon-folder-close': 'close_edit_form'
    
  render: ->
    $(@el).html(@template.render({
      description: @model.get('description'),
      labor_cost: @model.get('labor_cost'),
      material_cost: @model.get('material_cost'),
      unit_retail: @model.get('unit_retail')
    }, {}))

    @
    
  updateValue: ->
    $(@el).find('.description').html(@model.get('description'))
    $(@el).find('.labor_cost').html(@model.get('labor_cost'))
    $(@el).find('.material_cost').html(@model.get('material_cost'))
    $(@el).find('.unit_retail').html(@model.get('unit_retail'))
    
  show_edit_form: (e)->
    e.preventDefault()
    $('.open-task-input').removeClass('hide')
    $('.close-task-input').addClass('hide')
    
    $(@el).find('.open-task-input').addClass('hide')
    $(@el).find('.close-task-input').removeClass('hide')

    
    @edit_form_instance.showForm()
    
  close_edit_form: (e)->
    e.preventDefault()
    $(@el).find('.close-task-input').addClass('hide')
    $(@el).find('.open-task-input').removeClass('hide')
    
    @edit_form_instance.closeForm()
