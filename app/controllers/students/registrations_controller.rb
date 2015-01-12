class Students::RegistrationsController < Devise::RegistrationsController
  
  def sign_up_params
    params.require(:student).permit(:name, :age, :phone, :address, :identity_proof, :email, :password, :password_confirmation)
  end

end