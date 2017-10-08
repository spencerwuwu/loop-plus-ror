class Front::UserController < ApplicationController

  def show
  end

  def uses
  end

  def points
  end

  def payments
  end

  def to_pending
    user.remove_role(un_finish)
    user.add_role(pendin)

    StaffMailer.user_pending(current_user).deliver.now!
    flash[:notice] = "已收到！請靜代審核"
    render_to user_root_path
  end

  def back_pending
    user.remove_role(member)
    user.add_role(pending)

    StaffMailer.user_pending_again(current_user).deliver.now!
    render_to user_root_path
  end

end
