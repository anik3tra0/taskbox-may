class Task < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	#validates_presence_of :name
	validate :check_due_date

	private
	def check_due_date
		project = Project.find(self.project_id) if self.project_id
		if self.due_date < project.start_date
			errors.add(:due_date, "is invalid. Cannot be less than #{project.start_date}")
		end
	end
	
end
