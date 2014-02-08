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
    
    @project_tasks = new Phenomena.Collections.ProjectTasks()
    @project_tasks.reset(@project.get('project_tasks'))
    
    @template_tasks = new Phenomena.Collections.Tasks()
    @template_tasks.reset(options.tasks)

    # generate children    
    @headerView = new Phenomena.Views.ProjectDetailHeaderView({project: @project, project_tasks: @project_tasks})
    @summaryTab = new Phenomena.Views.ProjectSummaryView({project: @project, project_tasks: @project_tasks})
    @costingTab = new Phenomena.Views.ProjectCostingTabView({
      project: @project
      template_tasks: @template_tasks
      project_tasks: @project_tasks
    })
    @expenseTab = new Phenomena.Views.ProjectExpenseTabView({project: @project, project_tasks: @project_tasks})

    @children = [@headerView, @summaryTab, @costingTab, @expenseTab]
    @children_tabs = [@summaryTab, @costingTab, @expenseTab]
    
    @view = new Phenomena.Views.ProjectDetailView({
      children: @children
    })
    @swap(@view)
    

  dashboard: ->
    @hideAll()
    $(@summaryTab.el).removeClass('hide')
    
    $(@view.el).find('#project_nav_tab li').removeClass('active')
    $(@view.el).find('#project_nav_tab li.summary_tab').addClass('active')
    
  costing: ->
    @hideAll()
    $(@costingTab.el).removeClass('hide')
    
    $(@view.el).find('#project_nav_tab li').removeClass('active')
    $(@view.el).find('#project_nav_tab li.costing_tab').addClass('active')

  expense: ->
    @hideAll()
    $(@expenseTab.el).removeClass('hide')
    
    $(@view.el).find('#project_nav_tab li').removeClass('active')
    $(@view.el).find('#project_nav_tab li.expense_tab').addClass('active')

  # hide all sub tabs at once
  hideAll: ->
    _(@children_tabs).each (child_view)->
      $(child_view.el).addClass('hide')
