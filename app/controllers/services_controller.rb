class ServicesController < ApplicationController

  def show
  	@service = Service.find(params[:id])
  	render json: @service
  end

  private

  def service_params
    params.permit(:name, :task_left, :task_done, :task_total, :ready, :leader_id, :office_id)
  end

end
