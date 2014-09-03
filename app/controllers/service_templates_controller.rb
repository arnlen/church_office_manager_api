class ServiceTemplatesController < ApplicationController

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

  def service_template_params
    params.permit(:name, :leader_id)
  end

end
