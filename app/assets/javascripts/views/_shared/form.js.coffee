class Phenomena.Views.SharedForm extends Phenomena.View

  template: HoganTemplates["shared/modal"]
  
  render: ->
    form = new Backbone.Form({ model: @model}).render()
    $(@el).html(@template.render({
      type: 'form'
      header: @options.header
    },{}))
    
    $(@el).find('.modal-body').html(form.el)

    console.log $(@el).html()
    @
    
  events:
    'click a#submit' : 'submit_form'
    'click a#close' : 'close_form'
    
  close_form: (e) ->
    e.preventDefault
    $('#form_modal').modal('hide')
    @leave()
    
  submit_form: (e) ->
    e.preventDefault
    attributes = Backbone.Syphon.serialize(@)
    current_view = @
    console.log attributes
    
    @model.save(attributes, {
      wait: true,
      success: (model) ->
        #hide & remove dialog
        $('#form_modal').modal('hide')
        current_view.leave()
        
        # show corresponding alert
        current_view.prepend_and_fade_alert($(current_view.parent.el), current_view.options.success_message, 'success')
        
        # execute call back
        current_view.success_callback()
        
      error: (model, response) ->

        #clear all previous errors
        $('control-group .error').each ->
          $(this).removeClass('error')
          
        $('.help-block').each ->
          $(this).empty()
          
        #mark all fields with errors and show error text
        all_errors = JSON.parse(response.responseText).errors
        for attribute_namte, attribute_errors of all_errors
          attribute_container = $('input [name='+attribute_name+']')
          attribute_container.closest('.control-group').addClass('error')
          attribute_continaer.closest('.controls').find('.help-block').html(attribute_errors.join(', '))
          
        # show corresponding alert
        current_view.prepend_and_fade_alert($('modal-body'), current_view.options.error_message, 'error')
    })
    
    return false
    
  success_callback: ->
    return true
