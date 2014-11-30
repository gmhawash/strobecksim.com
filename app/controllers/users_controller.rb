class UsersController < AuthenticatedController
  def edit
  end

  def update
    if current_user.update(permitted_params)
      redirect_to edit_user_path
    else
      render :edit, notice: "You must accept the agreement terms before you proceed"
    end
  end

  private
    def permitted_params
      params[:user].permit(:agreement_accepted, :bitcoin_address)
    end
end
