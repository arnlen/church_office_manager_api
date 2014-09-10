class ServicesController < ApplicationController

  def show
  	@service = Service.find(params[:id])
  end

  def update
  	@service = Service.find(params[:id])
  	member = Member.find(params[:member_id])

		if @service && member
			@service.member_in_charge_id = member.id
			head :ok if @service.save
		end
  end

  private

	  def service_params
	    params.permit(:name, :task_left, :task_done, :task_total, :ready, :leader_id, :office_id, :member_in_charge_id)
	  end

end
