class Product < ActiveRecord::Base

	belongs_to :product_category
	validates_numericality_of :price, greater_than: 10	
end
