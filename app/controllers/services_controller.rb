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
  	member_in_charge = Member.find(params[:member_in_charge_id])

		if @service && member_in_charge
			@service.update_attributes(member_in_charge_id: member_in_charge.id)
      render "show"
		end
  end

  private

	  def service_params
	    params.permit(:name, :task_left, :task_done, :task_total, :ready, :leader_id, :office_id, :member_in_charge_id)
	  end

end
