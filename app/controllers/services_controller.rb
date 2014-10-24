class ServicesController < ApplicationController

  def index
    office = Office.find(params[:officeId])
    if office
      @services = office.services.order(:name)
    end
  end

  def show
  	@service = Service.find(params[:id])
    @service.leader = Member.find(@service.leader_id) if @service.leader_id
    @service.member_in_charge = Member.find(@service.member_in_charge_id) if @service.member_in_charge_id
    @service.tasks = @service.tasks
  end

  def update
  	@service = Service.find(params[:id])

    leader_id = if params[:leader_id].to_i != 0
      params[:leader_id]
    else
      if member = @service.members.first
        member.id
      else
        Member.first.id
      end
    end

		if @service
			@service.update_attributes(
        leader_id: leader_id,
        ready: params[:ready],
        task_done: params[:task_done],
        task_left: params[:task_left],
        member_in_charge_id: params[:member_in_charge_id]);

      render "show"
    else
      render json: { message: "Unable to update one or more user's attribute(s)" },
        status: :unprocessable_entity and return
		end
  end

  private

	  def service_params
	    params.permit(:name, :task_left, :task_done, :task_total, :ready, :leader_id, :office_id, :member_in_charge_id)
	  end

end
