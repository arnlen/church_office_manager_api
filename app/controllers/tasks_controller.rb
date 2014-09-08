class TasksController < ApplicationController

  before_action :authentication_required, only: [ :create, :destroy ]

  def update
  	@task = Task.find(params[:id])
  	@task.update_attributes(params[:task])
  end

  private

  def task_params
    params.permit(:name, :due_date, :completed, :service_id)
  end

end
