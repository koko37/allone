class Phenomena.Routers.Tasks extends Support.SwappingRouter
  routes:
    '' : 'index'

  initialize: ->
    @collection = new Phenomena.Collections.Tasks()
    @collection.fetch()
    @el= $("#container")    
    
  index: ->
    console.log "tasks routes"
    $(".navbar-fixed-top li").removeClass("active")
    $(".navbar-fixed-top li.task_page").addClass("active")

    view = Phenomena.Views.TasksIndexView({collection: @collection})
    @swap(view)
