class SimpleMailer < ActionMailer::Base
  default from: "notification@direwolf.com"

  def send_email(email, subject, message)
    @message = message
    mail(to: email, subject: subject)
  end

end
