class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.follow_up.subject
  #
  default from: "no-reply@example.com"
  def follow_up(email)
    mail(
      to: email,
      subject: "Welcome to Memori!"
    )
  end

end
