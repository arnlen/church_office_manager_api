class ServiceTemplatesController < ApplicationController

  before_action :authentication_required

  private

  def service_template_params
    params.permit(:name, :leader_id)
  end

end
