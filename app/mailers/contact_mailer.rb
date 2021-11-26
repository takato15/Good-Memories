class ContactMailer < ApplicationMailer
  def send_when_customer_(contact)
    @contact = contact
    mail(
      from: 'Good-Memories',
      to: ENV['SMTP_USERNAME'],
      subject: '【Good-Memories】お問い合わせ通知'
    )
  end

  def send_when_admin_reply(contact) # メソッドに対して引数を設定
    @contact = contact
    @title = contact.title
    @detail = contact.detail
    @answer = contact.detail_reply
    mail to: contact.email, subject: '【Good-Memories】 お問い合わせありがとうございます'
  end
end
