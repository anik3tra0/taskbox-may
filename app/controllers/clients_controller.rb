class ClientsController < ApplicationController
#7 rest actions = methods
#1. index - listing 
#2. new - used to setup a resource (new object) in form
#3. create - used to insert the data coming from form
#4. show - display details of a single resource 
#5. edit - fetch record and setup in form
#6. update - used to update data coming from form
#7. destroy - used to destroy a record 

#before any action in the controller in called, call before filter method


before_filter :authenticate_user!#, except: [:index]

load_and_authorize_resource 

def index
	@clients = current_user.role?("admin") ? Client.all : current_user.clients 
end

def new
	@client = Client.new
end

def create
	@client = Client.new(client_params)
	@client.user_id  = current_user.id
	if @client.save
		redirect_to clients_path, notice: "Successfully created"
	else
		render action: "new"
	end
end

def show
	@client = current_user.role?("admin") ? Client.find(params[:id]) : current_user.clients.find(params[:id])
end

def edit
	@client = Client.find(params[:id])
end

def update
	@client = Client.find(params[:id])
	if @client.update_attributes(client_params)
		redirect_to client_path(@client), notice: "Successfully updated"
	else
		render action: "edit"
	end
end

def destroy
	@client = Client.find(params[:id])
	@client.destroy
	redirect_to clients_path, notice: "Successfully deleted"
end


private
#client_params is used to serialize (clean up) the keys 
	def client_params
		params[:client].permit(:name, :company, :email, :website, :address, :mobile)
	end
end
