class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      subject = params[:contact][:subject]
      body = params[:contact][:messages]

      ContactMailer.contact_email(name, email, website, body).deliver
      flash[:notice] = "Thanks for reaching out. Your message sent succefully, We'll get back too you as soon as possible"
      redirect_to contact_path
    else
      flash[:danger] = 'Error occured, message could not be sent.'
      redirect_to contact_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :messages)
  end
end

