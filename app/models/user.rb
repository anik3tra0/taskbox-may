class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_one :profile
	has_many :clients
	has_many :projects
	has_many :tasks

	has_many :permissions
	has_many :roles, through: :permissions
	
	after_create :set_role

	def role?(role)
		self.roles.pluck(:name).include?(role)
	end

	def det_role
 		self.roles.push(Role.find(2))
	end

end
