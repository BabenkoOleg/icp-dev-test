class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    contacts = Contact.all
    render json: ContactSerializer.new(contacts)
  end

  # GET /contacts/:id
  def show
    render json: ContactSerializer.new(@contact)
  end

  # POST /contacts
  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: ContactSerializer.new(contact)
    else
      render json: contact.errors, status: :unprocessable_entity
    end
  end

  # PUT /contacts/:id
  def update
    if @contact.update(contact_params)
      render json: ContactSerializer.new(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    head :ok
  end

  # GET /companies/csv
  def csv
    attributes = %w{name email phone address position company_id}
    data = Contact.to_csv(attributes)
    send_data data, filename: "contacts-#{Date.today}.csv"
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact)
          .permit(:name, :email, :phone, :address, :position, :company_id)
  end
end
