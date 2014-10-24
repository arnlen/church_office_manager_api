class MembershipsController < ApplicationController

	before_action :check_member_and_service_params

  def create
  	@member = Member.find(params[:memberId])
  	my_service = Service.find(params[:serviceId])

  	if @member && my_service
			if @member.services << my_service
				head status: :created
			end
		end
  end

  def destroy
  	@member = Member.find(params[:memberId])
  	my_service = Service.find(params[:serviceId])

  	if @member && my_service
  		if @member.services.destroy(my_service)
  			head status: :no_content
  		end
  	end
  end

  private

  	def check_member_and_service_params
  		params[:memberId] && params[:serviceId]
  	end
end