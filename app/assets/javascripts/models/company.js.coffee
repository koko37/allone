class Phenomena.Models.Company extends Backbone.Model
  schema:
    name: { title: "Name" }
    phone: { title: "Telephone" }
    address: { title: "Address" }
    
  urlRoot: '/companies'
