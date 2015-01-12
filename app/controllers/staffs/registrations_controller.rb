class Staffs::RegistrationsController < Devise::RegistrationsController
  
  def sign_up_params
    params.require(:staff).permit(:name, :age, :phone, :employee_id, :email, :password, :password_confirmation)
  end

end