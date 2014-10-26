class OrganizationsUsersController < ApplicationController
  before_action :set_organization, only: [:update, :destroy]

  def update
    current_user.organizations << @organization
    redirect_to :back, notice: "Organization was succesfully added"
  end

  def destroy
    current_user.organizations.delete(@organization)
    redirect_to :back, notice: "Organization was succesfully added"
  end
  private
    def set_organization
      @organization = Organization.find(params[:id])
    end
end
