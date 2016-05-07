class TasksController < ApplicationController
	
	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Successfully created"
		end
	end


	def mark_as_complete
		@task = Task.find(params[:task])
		@task.update_attributes(is_completed: true)
		Notification.completed(@task).deliver!
		redirect_to :back, notice: "Marked as complete"
		#redirect_to project_path(@task.project_id)
	end

	private
	def task_params
		params[:task].permit(:name, :due_date, :project_id, :is_completed)
	end
end
