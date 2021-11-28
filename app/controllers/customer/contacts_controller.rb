class Customer::ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(created_at: :desc).page(params[:page]).per(15)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save(validate: false)
      ContactMailer.send_when_customer_contact(@contact).deliver_now
      redirect_to contacts_path, notice: "お問い合わせを送信しました。"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:customer_id, :name, :email, :title, :detail, :title_reply, :detail_reply)
  end
end
