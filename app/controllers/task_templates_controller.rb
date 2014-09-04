class TaskTemplatesController < ApplicationController

  before_action :authentication_required

  private

  def task_template_params
    params.permit(:name, :due_date)
  end

end
