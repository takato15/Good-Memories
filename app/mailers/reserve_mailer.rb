class ReserveMailer < ApplicationMailer
  def send_when_customer_reserve(reserve)
    @reserve = reserve
    mail(
      from: 'Good-Memories',
      to: ENV['SMTP_USERNAME'],
      subject: '【Good-Memories】撮影依頼通知'
    )
  end
end
