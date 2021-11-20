class Customer::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      @contacts = Contact.all
      render :new
    end
      flash[:success] = 'お問い合わせを送信しました。'
  end

  private

  def contact_params
    params.require(:contact).permit(:customer_id, :title, :detail, :reply)
  end

end
