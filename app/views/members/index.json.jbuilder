json.array! @members do |member|

	json.(member, :id, :name, :email, :phone)
	json.services member.services do |service|

		json.(service, :id, :name)

	end

end