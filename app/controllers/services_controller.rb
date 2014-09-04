class ServicesController < ApplicationController

  before_action :authentication_required

  private

  def service_params
    params.permit(:name, :task_left, :task_done, :task_total, :ready, :leader_id, :office_id)
  end

end
