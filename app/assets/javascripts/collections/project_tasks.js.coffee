class Phenomena.Collections.ProjectTasks extends Backbone.Collection
  url: '/project_tasks'
  
  model: Phenomena.Models.ProjectTask
  
  cost: ->
    cost_sumup = 0.0
    _(@models).each( (project_task) ->
      cost_sumup += project_task.cost()
    )
    Math.floor(cost_sumup)

  price: ->
    cost_sumup = 0.0
    _(@models).each( (project_task) ->
      cost_sumup += Math.floor(project_task.get('unit_retail'))
    )
    Math.floor(cost_sumup)
  
  profit: ->
    profit_sumup = 0.0
    _(@models).each( (project_task) ->
      profit_sumup += project_task.profit()
    )
    Math.floor(profit_sumup)

    
  margin: ->
    Math.round( 100 * @profit() / @price())
