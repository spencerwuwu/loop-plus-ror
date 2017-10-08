class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #

  def user_success(user)
    @user = user

    if user.common_email.present?
      mail(:to => user.common_email,  :subject => "Loop+會員審核成功!")
    else
      mail(:to => user.email,  :subject => "Loop+會員審核成功!")
    end
  end

  def user_reject(user, reason)
    @user = user
    @reason = reason

    if user.common_email.present?
      mail(:to => user.common_email,  :subject => "Loop+會員失敗:(")
    else
      mail(:to => user.email,  :subject => "Loop+會員失敗:(")
    end
  end

  def notify_comment(user, topic, message)
    @message = message

    mail(:to => user,  :subject => topic)
  end
end
