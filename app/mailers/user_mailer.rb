class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  def notify_comment
    @greeting = "Hi"

    mail(:to => "spencerwu85@gmail.com",  :subject => "New Comment")
  end
end
