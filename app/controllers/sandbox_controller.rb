class SandboxController < ApplicationController
  def clients
    #shared variables are instance variables
  	@clients = Client.order('name')
  end

  def projects
  	@projects = Project.order('start_date DESC').limit(50)
  end

  private 

  def tasks
  	@all_tasks = Task.count
  	@completed_tasks = Task.where('is_completed = ?', true)
  	@incomplete_tasks = Task.where('is_completed = ? AND due_date >= ?', false, Date.today)
  	@over_due_tasks = Task.where('is_completed = ? AND due_date < ?', false, Date.today)
  end
end
