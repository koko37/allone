//= require_tree ./templates/companies
//= require_tree ./templates/shared
//= require_tree ./models
//= require_tree ./collections
//= require      ./views/_shared/form
//= require_tree ./views/companies
//= require ./routers/companies

$(document).ready ->
  Phenomena.init_company()
