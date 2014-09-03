class ServicesController < ApplicationController

  before_action :authentication_required

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def service_params
    params.permit(:name, :task_left, :task_done, :task_total, :ready, :leader_id, :office_id)
  end

end
