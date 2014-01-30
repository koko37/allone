class Phenomena.Views.ProjectDetailHeaderView extends Phenomena.View
  template: HoganTemplates["projects/header_view"]
  
  initialize: (options)->
    _.bindAll(this, 'render')
    @project = options.project
    
  render: ->
    console.log "header view render..."
    console.log @project
    $(@el).html(@template.render({
      work_order_number: @project.get("work_order_number")
      manager: @project.get("manager")
      description: @project.get("description")
    },{}))
    
    @
