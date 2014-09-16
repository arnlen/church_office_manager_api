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

        # Case 2: member => become leader
        elsif is_member && !is_leader
          @service.leader_id = @member.id

        # Case 3: leader => not member
        elsif is_leader
          @service.leader_id = nil
          @member.services.where(id: @service.id).first.destroy
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