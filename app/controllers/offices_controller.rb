class OfficesController < ApplicationController

  before_action :authentication_required, only: [ :update, :destroy ]

  def next_office
    amount = params[:amount] || 1
    @offices = Office.next(amount)
  end

  private

    def office_params
      params.permit(:date)
    end

end
