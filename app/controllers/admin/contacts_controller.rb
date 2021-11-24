class Admin::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to admin_contacts_path, notice: "問い合わせ情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path, notice: "問い合わせ情報を削除しました。"
  end

  private

  def contact_params
    params.require(:contact).permit(:customer_id, :title, :detail, :title_reply, :detail_reply)
  end

end
