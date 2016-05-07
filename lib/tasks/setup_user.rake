desc "Used to setup initial users"
task :setup_user => :environment do 
	Role.create(name: "admin")
	Role.create(name: "user")
	Role.create(name: "client")
	Role.create(name: "acc")

	users = User.all 
	for user in users
		Permission.create(user_id: user.id, role_id: 2)
	end


	user = User.new
	user.email = "admin@gmail.com"
	user.password = "secret123"
	user.save

	Permission.create(user_id: user.id, role_id: 1)

end