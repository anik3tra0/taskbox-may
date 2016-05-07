class Api::SandboxController < ApplicationController
	respond_to :json
	
	def client_details
		client = Client.find(params[:id])
		client.update_attributes(name: params[:name], mobile: params[:mobile])
		render status: 200
	end

end
