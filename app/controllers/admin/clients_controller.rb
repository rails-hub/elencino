class Admin::ClientsController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def index
    @users = User.with_role(:client)
  end

  def new
    @user = User.new
    @client = @user.build_client
  end

  def edit
    @user = User.find(params[:id])
    @client = @user.client
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "User Destroyed Successfully."
    redirect_to admin_clients_path
  end

  private

  def admin_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :password_confirmation)
  end

end