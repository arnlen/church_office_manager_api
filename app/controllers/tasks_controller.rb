class TasksController < ApplicationController

  def index
    if service_id = params[:serviceId]
      @tasks = Task.where(service_id: service_id)
    end
  end

  def show
    if params[:id] && @task = Task.find(params[:id])
      render json: @task
    end
  end

  def update
  	@task = Task.find(params[:id])
  	if @task.update_attributes(completed: params[:completed])
  		@task.service.refresh_counters
  		render 'show'
  	end
  end

  private

    def task_params
      params.permit(:name, :due_date, :completed, :service_id)
    end

end
