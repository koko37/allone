class Phenomena.Routers.Companies extends Support.SwappingRouter
  routes:
    '': 'index'
    '/companies' : 'index'
    
  initialize: ->
    @collection = new Phenomena.Collections.Companies()
    @collection.fetch()

    @el = $("#container")
    
  index: ->
    view = new Phenomena.Views.CompaniesIndex({collection: @collection})
    @swap(view)
