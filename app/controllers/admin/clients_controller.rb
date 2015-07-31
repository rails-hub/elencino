class Admin::ClientsController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin_or_manager_or_salesman
  before_filter :can_see_client, :only => [:edit, :update]

  def index
    @users = current_user.my_clients
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