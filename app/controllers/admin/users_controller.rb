class Admin::UsersController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def index
    @users = User.with_role(":#{admin_params[:type]}")
  end

  private

  def admin_params
    params.permit(:type)
  end

end