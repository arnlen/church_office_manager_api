class TasksController < ApplicationController

  before_action :authentication_required, only: [ :create, :destroy ]

  private

  def task_params
    params.permit(:name, :due_date, :completed, :service_id)
  end

end
