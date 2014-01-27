class Phenomena.Views.CompaniesEdit extends Phenomena.Views.SharedForm
  initialize: ->
    @options.header = "Register edit company"
    @options.success_message = "Company successfully registered"
    @options.error_message = "Sorry, there is an error while adding new company."
