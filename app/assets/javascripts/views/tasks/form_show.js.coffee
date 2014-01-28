class Phenomena.Views.TaskFormShowView extends Phenomena.View
  tagName: 'tr'
  template: HoganTemplates["tasks/form_show"]
  
  initialize: ->
    _.bindAll(this, 'render')
  
  events: ->
    'change input': 'on_change_data'
    
  render: ->
    # add row template
    $(@el).html(@template.render({
      id: @model.id
    },{}))

    # add model edit form
    f= new Backbone.Form({model: @model})
    $(@el).find('.task_edit_form_row').html(f.render().el)
    @
    
  on_change_data: ->
    console.log "on change data ..."
    attributes = Backbone.Syphon.serialize(@)
    @model.save(attributes)
    
  showForm: ->
    $('.task_edit_form_row').addClass('hide')
    $(@el).find('.hide').removeClass('hide')
    
  closeForm: ->
    $(@el).find('td').addClass('hide')
