class Admin::ClientsController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin_or_manager_or_salesman
  before_filter :can_see_client, :only => [:edit, :update]

  def index
    @users = Client.all.where('salesman_id = ?', current_user.id)
  end

  def new
    @user = Client.new
  end

  def edit
    @user = Client.find(params[:id])
  end

  def create
    user = Client.new(admin_params)
    user.salesman_id = current_user.id
    if user.save
      flash[:notice] = "User Created Successfully."
      redirect_to admin_clients_path
    else
      flash[:danger] = user.errors.full_messages
      redirect_to new_admin_client_path
    end

  end

  def update
    user = Client.find(params[:id])
    user_update = user.update_attributes(admin_params)
    if user_update
      flash[:notice] = "User Updated Successfully."
      redirect_to admin_clients_path
    else
      flash[:danger] = user.errors.full_messages
      redirect_to edit_admin_client_path
    end

  end

  def destroy
    user = Client.find(params[:id])
    user.destroy
    flash[:notice] = "User Destroyed Successfully."
    redirect_to admin_clients_path
  end

  private

  def admin_params
    params.require(:client).permit(:name, :first_last_name, :second_last_name, :date_of_birth, :nationality,
                                   :municipality_of_birth, :state_of_birth, :sex, :occupation, :married,
                                    :matrimonial_regime, :rfc, :curp, :street, :interior_number, :exterior_number,
                                     :suburb, :municipality, :state, :postal_address, :mobile_number, :office_number, :home_number, :email )
  end

end