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
          @message = "#{@member.name} est maintenant membre du service #{@service.name}."

        # Case 2: member => not a member
        elsif is_member && !is_leader
          @member.services.delete(@service)
          @message = "#{@member.name} n'est plus membre du service #{@service.name}."

        # Case 3: leader => raise error
        elsif is_leader
          render json: { message: "#{@member.name} est responsable du service #{@service.name} et ne peut donc pas le quitter." },
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