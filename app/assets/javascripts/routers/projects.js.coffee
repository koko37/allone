class Phenomena.Routers.ProjectsRouter extends Support.SwappingRouter

  routes:
    '': 'index'

  initialize: ->
    @el= $('#projects_list_view')
    
  index: ->
    t = @
    data = {
      name: 'John'
      birth: '1982'
    }
    console.log "Loading index view ..."
    
    @collection = new Phenomena.Collections.Projects()
    @collection.fetch({
      data: data
      success: ->
        view = new Phenomena.Views.ProjectsIndexView({collection: t.collection})
        t.swap(view)
    })
