class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.create!(sign_up_params)
    json_response(@user, api_v1_user_url(@user), :created)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
  end
end
