class TaskTemplatesController < ApplicationController

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

  def task_template_params
    params.permit(:name, :due_date)
  end

end
