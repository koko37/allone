class Phenomena.Views.ProjectsIndexView extends Phenomena.View
  template: HoganTemplates["projects/index"]
  
  initialize: ->
    _.bindAll(this, 'render', 'addProject', 'add_new_project')
    @collection.on('add', @addProject)
  events: ->
    'click #new_project_trigger' : 'add_new_project'
    
  render: ->
    # mark top-nav-bar
    $(".navbar-fixed-top li").removeClass("active")
    $(".navbar-fixed-top li.project_page").addClass("active")
    
    current_view = @
    
    # adding intial template view
    $(@el).html(@template.render({},{}))

    # adding project rows
    @collection.each (project)->
      current_view.addProject(project)

    @
    
  addProject: (model)->
    listView = new Phenomena.Views.ProjectListShowView({model: model})
    @appendChildTo(listView, $(@el).find('#projects_list_table_body'))
    
  add_new_project: (e) ->
    e.preventDefault()
    t= @
    
    project = new Phenomena.Models.Project()
    project.save({},{
      wait: true
      success: (model)->
        console.log "add new project success ..."
        t.collection.push(project)
    })
    
