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
  
  task :add_projects => :environment do
    5.times do |i|
      p = Project.new
      p.work_order_number = 137*i + i
      p.description = "Project description #{i}"
      p.save
    end
  end
  
end
