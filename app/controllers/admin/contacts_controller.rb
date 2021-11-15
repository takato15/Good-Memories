class Admin::ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
    @customers = Customer.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
    contact.update(contact_params)
    customer = contact.customer
    ContactMailer.send_when_admin_reply(customer, contact).deliver_now #確認メールを送信
    redirect_to root_path
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
    @customers = Customer.all
    render :index
  end

  private
  
  def contact_params
    params.require(:contact).permit(:title, :detail, :reply)
  end
  
end
