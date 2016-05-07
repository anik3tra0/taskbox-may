class ProjectsController < ApplicationController
	def index
		#eager loading
		@projects = current_user.projects.includes(:client, :categories)
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to projects_path
		else
			render action: "new"
		end
	end

	def show
		begin
			@project = Project.find(params[:id])
			@tasks = @project.tasks
			@task = Task.new # this creates a new task object with project id 
			@over_due_tasks = @tasks.where('due_date < ? AND is_completed = ?', Date.today, false)
			@completed_tasks = @tasks.where('is_completed = ?', true)
			@incomplete_tasks = @tasks.where('due_date >= ? AND is_completed = ?', Date.today, false)
		rescue ActiveRecord::RecordNotFound 
			redirect_to projects_path, notice: "Record Not Found"
		end
	end

	private

	def project_params
		params[:project].permit(:name, :description, :start_date, :status,         :client_id, category_ids: [])
	end
end
