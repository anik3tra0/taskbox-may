class Profile < ActiveRecord::Base
	#belongs_to is written in the model which contains the foreign key reference
	belongs_to :user
end
