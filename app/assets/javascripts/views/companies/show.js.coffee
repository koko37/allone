class Phenomena.Views.CompaniesShow extends Phenomena.View

  template: HoganTemplates["companies/show"]
  tagName: 'tr'
  
  initialize: ->
    _.bindAll(@, 'render', 'leave')
    
    @model.on('change',@render)
    @model.on('destroy', @leave)
    
  render: ->
    $(@el).html(@template.render({
      name: @model.get('name'),
      phone: @model.get('phone'),
      address: @model.get('address')
      id: @model.id
    }, {}))
    
    @
    
  events: 
    'click .edit_company' : 'show_edit_company_modal'
    'click .destroy_company' : 'destroy_company'
    
  show_edit_company_modal: (e) ->
    e.preventDefault()
    view = new Phenomena.Views.CompaniesEdit({model: @model})
    @.parent.appendChild(view)
    $('#form_modal').modal()
    
  destroy_company: (e) ->
    e.preventDefault()
    current_view = @
    
    @model.destroy({
      wait: true
      success: ->
        current_view.prepend_and_fade_alert($(current_view.parent.el),'Company successfully removed','success')
        
      error: (model, response) ->
        current_view.prepend_and_fade_alert($(current_view.parent.el),'Company can not be removed','error')
        
    })
