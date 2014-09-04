class OfficesController < ApplicationController

  before_action :authentication_required, only: [ :update, :destroy ]

  def next_office
    office = Office.next
    Service.create_or_reset_office_services(office) unless @office.services.count === ServiceTemplate.count
  end

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

    def office_params
      params.permit(:date)
    end

end
