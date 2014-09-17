class MembersController < ApplicationController

  def index
    @members = Member.order(:name)
  end

  def show
  	@member = Member.find(params[:id])
  end

  def update
    if params[:serviceId]
      @member = Member.find(params[:id])
      @service = Service.find(params[:serviceId])
      is_member = params[:isMember] && params[:isMember] === "true"
      is_leader = params[:isLeader] && params[:isLeader] === "true"

      if @member && @service

        # Case 1: not member => become member
        if !is_member && !is_leader
          @member.services << @service

        # Case 2: member => not a member
        elsif is_member && !is_leader
          @member.services.delete(@service)

        # Case 3: leader => raise error
        elsif is_leader
          render json: { error: "This member is leader of this service" },
            status: :unprocessable_entity and return
        end

        if @member.save && @service.save
          render "show"
        end

      end
    end
  end

  private

	  def member_params
	    params.permit(:name, :email, :phone)
	  end

end