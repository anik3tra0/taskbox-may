class Category < ActiveRecord::Base
	#has_many :join_table
	#has_many :assoicated_table, through: :join_table
	has_many :project_categories
	has_many :projects, through: :project_categories
	
end
