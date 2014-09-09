class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
  	@member = Member.find(params[:id])
  end

  private

	  def member_params
	    params.permit(:name, :email, :phone)
	  end

end