Client.delete_all
Project.delete_all
Task.delete_all
User.delete_all
Profile.delete_all
ProjectCategory.delete_all

User.create(email: "1@gmail.com", password: "secret123")
User.create(email: "2@gmail.com", password: "secret123")
User.create(email: "3@gmail.com", password: "secret123")
User.create(email: "4@gmail.com", password: "secret123")
User.create(email: "5@gmail.com", password: "secret123")

20.times do 
	client = Client.new
	client.name = Faker::Name.first_name
	client.company = Faker::Company.name 
	#client.email = Faker::Internet.free_email(client.name)
	client.mobile = Faker::Number.number(10)
  client.website = Faker::Internet.domain_name
  client.address = Faker::Address.city
  client.user_id = User.all.sample.id
  client.save
end

70.times do 
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.sentence
	project.status = ["new", "on-going","completed"].sample
	project.start_date = Faker::Date.between((Date.today - 1.year).beginning_of_year, Date.today)
	project.client_id = Client.all.pluck(:id).sample
	 # Client.order("RANDOM()").first.id
	 project.user_id = project.client.user_id 
	project.save
end

200.times do 
	task = Task.new
	task.name = ["logo design", "ppt design", "client meeting", "vendor finalization"].sample
	project_id = Project.all.pluck(:id).sample
	project = Project.find(project_id)
	task.project_id = project.id
	task.due_date = Faker::Date.between(project.start_date, project.start_date + 3.weeks)
	task.is_completed = [true,false].sample
	task.user_id = project.user_id 
	task.save
end

projects = Project.all 
for project in projects
	project.categories.push(Category.first((1..5).to_a.sample))
end


