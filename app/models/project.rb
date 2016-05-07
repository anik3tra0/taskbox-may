class Project < ActiveRecord::Base

	has_many :tasks
	belongs_to :client
	belongs_to :user
	
	#has_many :join_table
	#has_many :assoicated_table, through: :join_table

	has_many :project_categories
	has_many :categories, through: :project_categories


	def self.status_type(type)
		Project.where('status = ?', type)
	end

	def self.new_projects
		Project.where('status = ?', "new")
	end

	def self.recent_projects
		Project.order('start_date DESC').limit(5)
	end

	def client_name
		Client.find(self.client_id).name
	end

	def self. this_year_projects
		Project.where('start_date > ?', Date.today.beginning_of_year)
	end

end

=begin
clients
id (pk) | name 

projects 
id | name | client_id (fk)
=end