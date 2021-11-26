class Admin::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
    @customer = @contact.customer_id
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    ContactMailer.send_when_admin_reply(contact).deliver_now
    redirect_to admin_contacts_path, notice: "お問い合わせ情報を送信しました。"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path, notice: "問い合わせ情報を削除しました。"
  end

  private

  def contact_params
    params.require(:contact).permit(:customer_id, :name, :email, :title, :detail, :title_reply, :detail_reply)
  end

end
