class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		@category.save
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(params[:category].permit(:name))
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy 
	end

end
