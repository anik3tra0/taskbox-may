class Api::ProjectsController < ApplicationController
	respond_to :json

	def projects_by_category
		category_id = Category.find_by_name(params[:name]).id
		@projects = ProjectCategory.where('category_id = ?', category_id)
	end

end