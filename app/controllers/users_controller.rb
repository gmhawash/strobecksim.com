class UsersController < AuthenticatedController
  before_action :correct_user?

  def edit

  end

  def update
    if @user.update(permitted_params)
      redirect_to organizations_url
    else
      render :edit, notice: "You must accept the agreement terms before you proceed"
    end
  end

  private
    def correct_user?
      @user = User.find_by(id: params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def permitted_params
      params[:user].permit(:agreement_accepted, :bitcoin_address)
    end
end
