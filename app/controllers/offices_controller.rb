class OfficesController < ApplicationController

  before_action :authentication_required, only: [ :update, :destroy ]

  # Two mechanisms for this method:
  # => Grab the next office after the specified date by sending the keyword "next"
  # => Grab any office by giving its ID
  def show
    date = params[:date] || Date.today

  	@office = if params[:id] === "next"
  		Office.get_next(date.to_date)
    elsif params[:id] === "previous"
      Office.get_previous(date.to_date)
  	else
  		Office.find(id)
  	end

    render json: { error: "No previous office found" }, status: :not_found if !@office
  end

  private

    def office_params
      params.permit(:date)
    end

end
