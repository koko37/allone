class Phenomena.Routers.Tasks extends Support.SwappingRouter
  routes:
    '' : 'index'

  initialize: ->
    @collection = new Phenomena.Collections.Tasks()
    @el= $("#container")    

        
  index: ->
    console.log "tasks routes"
    $(".navbar-fixed-top li").removeClass("active")
    $(".navbar-fixed-top li.task_page").addClass("active")
    t = @
    
    @collection.fetch({
      success: ->
        view = new Phenomena.Views.TasksIndexView({collection: t.collection})
        t.swap(view)
    })

