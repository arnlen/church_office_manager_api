class MembersController < ApplicationController

  def index
    if params[:serviceId] && @service = Service.find(params[:serviceId])
      @members = @service.members.order(:name)
    else
      @members = Member.order(:name)
    end
  end

  def show
  	@member = Member.find(params[:id])
  end

  def update
    if params[:id] && @member = Member.find(params[:id])

      # Step 1. Regular attributes update
      if @member.update_attributes(email: params[:email], name: params[:name], phone: params[:phone])

        # Step 2. Update services if needed
        if params[:serviceId]
          is_member = params[:isMember] && params[:isMember] === "true"
          is_leader = params[:isLeader] && params[:isLeader] === "true"

          if @service = Service.find(params[:serviceId])

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
        else
          render "show"
        end
        # end update services

      else
        render json: { message: "Unable to update one or more user's attribute(s)" },
          status: :unprocessable_entity and return
      end

    end
  end

  private

	  def member_params
	    params.permit(:name, :email, :phone)
	  end

end