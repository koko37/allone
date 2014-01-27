class Phenomena.Views.CompaniesNew extends Phenomena.Views.SharedForm
  initialize: ->
    @options.header = "Register new company"
    @options.success_message = "Company successfully registered"
    @options.error_message = "Sorry, there is an error while adding new company."
    
  success_callback: ->
    @collection.add(@model)
