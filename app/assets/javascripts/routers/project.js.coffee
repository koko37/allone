class Phenomena.Routers.ProjectDetailRouter extends Support.SwappingRouter

  routes:
    '': 'dashboard'
    'summary': 'dashboard'
    'costing': 'costing'
    'expense': 'expense'
    
  initialize: (options)->
    @el= $('#project_detail_view')
    
    # get project info
    @project= new Phenomena.Models.Project()
    @project.set(options.project)
    
    # create inner-views
    @headerView = new Phenomena.Views.ProjectDetailHeaderView({project: @project})
    @summaryTab = new Phenomena.Views.ProjectSummaryView({project: @project})
    @costingTab = new Phenomena.Views.ProjectCostingTabView({project: @project})
    @expenseTab = new Phenomena.Views.ProjectExpenseTabView({project: @project})
    
  dashboard: ->
    view = new Phenomena.Views.ProjectDetailView({
      project: @project
      header_view: @headerView
      tab_view: @summaryTab
    })
    @swap(view)

    $(view.el).find('#project_nav_tab li').removeClass('active')
    $(view.el).find('#project_nav_tab li.summary_tab').addClass('active')
    
  costing: ->
    console.log "costing tab ..."
    view = new Phenomena.Views.ProjectDetailView({
      project: @project
      header_view: @headerView
      tab_view: @costingTab
    })
    @swap(view)

    $(view.el).find('#project_nav_tab li').removeClass('active')
    $(view.el).find('#project_nav_tab li.costing_tab').addClass('active')

  expense: ->
    view = new Phenomena.Views.ProjectDetailView({
      project: @project
      header_view: @headerView
      tab_view: @expenseTab
    })
    @swap(view)

    $(view.el).find('#project_nav_tab li').removeClass('active')
    $(view.el).find('#project_nav_tab li.expense_tab').addClass('active')

