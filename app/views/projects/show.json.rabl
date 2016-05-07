object @project
attributes :name, :start_date, :client_id, :status

child :tasks do 
	attributes :name, :is_completed, :due_date
end