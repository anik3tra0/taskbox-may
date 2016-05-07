class Client < ActiveRecord::Base

	#associations
	# -> has_many , has_many through: 
	# -> belongs_to 
	#validations
	#call_backs 
	#custom methods
	#private methods

	has_many :projects 
	belongs_to :user

	validates_presence_of :name, :company
	validates_length_of :mobile, is: 10
	validates_numericality_of :mobile
	validates_uniqueness_of :company, message: "already registered"

	def details
		"#{name} - #{company}"
	end

	def list_projects
		Project.where('client_id = ?', self.id)
	end

end
