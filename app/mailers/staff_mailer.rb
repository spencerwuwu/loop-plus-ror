class StaffMailer < ApplicationMailer

  def staff_mail
    "looplusgogo@gmail.com"
  end

  def user_pending_again(user)
    @user = user

    mail(:to => staff_mail,  :subject => "會員變更審核-#{user.name}")
  end

  def user_pending(user)
    @user = user

    mail(:to => staff_mail,  :subject => "會員審核-#{user.name}")
  end

end
