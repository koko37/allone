class Phenomena.Routers.Companies extends Support.SwappingRouter
  routes:
    '': 'companies'
    'company' : 'companies'

  initialize: ->
    @collection = new Phenomena.Collections.Companies()
    @collection.fetch()

    @el = $("#container")
    
  companies: ->
    console.log "companies index ..."
    $(".navbar-fixed-top li").removeClass("active")
    $(".navbar-fixed-top li.company_page").addClass("active")

    view = new Phenomena.Views.CompaniesIndex({collection: @collection})
    @swap(view)

