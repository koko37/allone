class Phenomena.Views.ProjectTaskEditRowView extends Phenomena.View
  template: HoganTemplates["project_tasks/edit_row"]
  tagName: 'tr'
  
  initialize: (options)->
    @project_task = options.project_task
    @template_tasks = options.template_tasks

    @project_task.schema.task_id.options = @template_tasks
    @edit_form = new Backbone.Form({model: @project_task}).render()
    
    # events handler
    current_view = @
    
    # select task
    @edit_form.on('task_id:change', (form, task_id_selector) ->
      task_id_value = task_id_selector.getValue()
      selected_task = current_view.template_tasks.findWhere({id: parseInt(task_id_value)})
      
      # selected task template, so update attribute
      form.setValue({
        labor_cost: selected_task.get('labor_cost')
        material_cost: selected_task.get('material_cost')
        unit_retail: selected_task.get('unit_retail')
      })
      current_view.project_task.set({description: selected_task.get('description')})
      # save form
      form.commit()
      current_view.project_task.save({
        wait: true
      })
      
    )

    # change period
    @edit_form.on('period:change', (form, new_value) ->
      form.commit()
      current_view.project_task.save({
        wait: true
      })
    )

    
  render: ->
    $(@el).html(@template.render({
      
    },{}))
    $(@el).find('.edit_form_content').html(@edit_form.el)
    
    @
    
  showForm: ->
    # hide all previous forms
    $('td.edit_project_task_row').addClass('hide')
    # show current form only
    $(@el).find('td').removeClass('hide')
    
  hideForm: ->
    $(@el).find('td').addClass('hide')

