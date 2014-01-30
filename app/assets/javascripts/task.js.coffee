//= require_tree ./templates/tasks
//= require_tree ./templates/shared
//= require_tree ./models
//= require_tree ./collections
//= require      ./views/_shared/form
//= require_tree ./views/tasks
//= require ./routers/tasks

$(document).ready ->
  Phenomena.init_task()
