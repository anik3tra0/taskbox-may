module Faker
	class Indian
		def self.name
			["ramesh", "suresh", "mahesh", "rajesh"].sample
		end

		def self.city
			["Bangalore", "Mysore", "Mandya"].sample
		end
	end

	class American
		def self.name
			["John", "Doe", "Smith", "Joe"].sample
		end

		def self.city
			["Santa Clara", "San Jose", "Houston", "Las Vegas"].sample
		end
	end
end

puts Faker::Indian.name
puts Faker::American.name

puts Faker::Indian.city
puts Faker::American.city


clients = Client.all
for client in clients
	puts client.name
	projects = Project.where('client_id = ?', client.id)
	for project in projects
		puts "->" + project.name
	end 
	puts "*" * 50 
end

projects_asc = Project.order('start_date')
projects_desc = Project.order('start_date DESC')
recent_5_projects = Project.order('start_date DESC').limit(5)


clients_alpha = Client.order('name')

client = Client.first
client.update_attributes(name: "new name", company: "new company")


project = Project.last 
project.destroy # object now in frozen mode 
#project.frozen? 

#undo destroy 
new_project = project.dup
new_project.save 


10.times do 
	ProductCategory.create(name: Faker::Commerce.department)
end

15000.times do 
	Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, product_category_id: ProductCategory.all.sample.id)
end



