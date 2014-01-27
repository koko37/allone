window.Phenomena =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  
  init_company: ->
    new Phenomena.Routers.Companies()
    Backbone.history.start()
   
  init_task: ->
    new Phenomena.Routers.Tasks()
    Backbone.history.start()
   

