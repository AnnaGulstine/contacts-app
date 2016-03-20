class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
  end

  def new
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      latitude: coordinates[0],
      longitude: coordinates[1],
      bio: params[:bio],
      user_id: current_user.id      
    )
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)   
    @contact.update(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio]
    )    
  end

  def destroy
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id) 
    contact.delete
  end
end