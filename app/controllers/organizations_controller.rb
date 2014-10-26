class OrganizationsController < AuthenticatedController
  before_action :ensure_agreement_accepted

  def create
    if Organization.create(permitted_params)
      redirect_to :back
    else
      render :index
    end
  end

  def destroy
    organization = Organization.find(params[:id])
    if organization.destroy
      redirect_to :back
    end
  end

  private
    def ensure_agreement_accepted
      unless current_user.agreement_accepted
        redirect_to edit_user_path, notice: "You must accept the agreement terms before you proceed"
      end
    end

    def permitted_params
      params[:organization].permit(:github_id, :name, :avatar_url)
    end
end
