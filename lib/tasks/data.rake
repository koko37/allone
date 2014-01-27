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

end
