class TasksController < ApplicationController

  before_action :authentication_required, only: [ :create, :destroy ]

  def update
  	@task = Task.find(params[:id])
  	if @task.update_attributes(completed: params[:completed])
  		@task.service.office.refresh
  		head :ok
  	end
  end

  private

  def task_params
    params.permit(:name, :due_date, :completed, :service_id)
  end

end
