class Phenomena.Views.TaskFormShowView extends Phenomena.View
  tagName: 'tr'
  template: HoganTemplates["tasks/form_show"]
  
  initialize: ->
    _.bindAll(this, 'render','on_change_data','showForm','closeForm')
  
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
    
  on_change_data: (e)->
    attributes = Backbone.Syphon.serialize(@)
    @model.save(attributes,{
      wait: true, 
      success: (model) ->
        console.log "ok"
      error: (model) ->
        console.log "failing save"
    })
    
  showForm: ->
    # hide previous form
    $('.task_edit_form_row').addClass('hide')
    
    # open current form
    $(@el).find('.hide').removeClass('hide')
    
  closeForm: ->
    $(@el).find('td').addClass('hide')
