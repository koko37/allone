class Phenomena.Views.ProjectListShowView extends Phenomena.View
  tagName: 'tr'
  template: HoganTemplates["projects/list_show"]
  
  initialize: ->
    _.bindAll(this, 'render')
  events: ->
    'click .delete_project': 'delete_project'  
    
  render: ->
    $(@el).html(@template.render({
      id: @model.id
      work_order_number: @model.get('work_order_number')
      description: @model.get('description')
      created_at: @model.get('created_at')
      manager: 'Fixed'
    },{}))
    
    @
    
  delete_project: (e) ->
    e.preventDefault()
    if !confirm("Are you sure to remove?")
      return false
      
    view= @
    
    @model.destroy({
      wait: true
      success: ->
        view.parent.prepend_and_fade_alert($(view.parent.el),"Project removed...",'success')
        view.leave()
    })
