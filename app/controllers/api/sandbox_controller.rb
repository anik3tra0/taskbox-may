class Api::SandboxController < ApplicationController

	def client_details
		client = Client.find(params[:id])
		client.update_attributes(name: params[:name], mobile: params[:mobile])
		render status: 200
	end

end
