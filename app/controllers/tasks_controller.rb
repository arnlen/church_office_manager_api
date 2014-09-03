class TasksController < ApplicationController

  before_action :authentication_required, only: [ :create, :destroy ]

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.permit(:name, :due_date, :completed, :service_id)
  end

end
