class OfficesController < ApplicationController

  before_action :authentication_required, only: [ :update, :destroy ]

  def next_office
  	render json: "This endpoint is not used anymore", status: :not_implemented
  end

  # Two mechanisms for this method:
  # => Grab the next office after the specified date by sending the keyword "next"
  # => Grab any office by giving its ID
  def show
  	@office = if params[:id] === "next"
  		date = params[:date] || Date.today
  		Office.get_next(date.to_date)
  	else
  		Office.find(id)
  	end
  end

  private

    def office_params
      params.permit(:date)
    end

end
