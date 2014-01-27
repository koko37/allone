class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :address
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
