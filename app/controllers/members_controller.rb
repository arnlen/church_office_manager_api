class MembersController < ApplicationController

  before_action :authentication_required, only: [ :create, :update, :destroy ]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def member_params
    params.permit(:name, :email, :phone)
  end

end