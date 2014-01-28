namespace :data do
  task :add_companies => :environment do

    100.times do |i|
      c = Company.new
      c.name = "company_#{i}"
      c.phone = "123-456-789"
      c.address = "company #{i} address"
      c.save
    end
  end

  task :add_tasks => :environment do
    20.times do |i|
      t = Task.new
      t.description = "task description is_#{i}"
      t.labor_cost = 2.5 * i
      t.material_cost = 1.5
      t.unit_retail = 132.5
      t.save
    end
  end
  
end
