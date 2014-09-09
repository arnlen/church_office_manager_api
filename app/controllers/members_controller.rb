class MembersController < ApplicationController

  before_action :authentication_required, only: [ :create, :update, :destroy ]

  def index
    render json: Member.all
  end

  def show
  	@member = Member.find(params[:id])
  end

  private

	  def member_params
	    params.permit(:name, :email, :phone)
	  end

end