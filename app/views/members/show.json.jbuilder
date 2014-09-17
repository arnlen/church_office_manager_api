json.(@member, :id, :name, :email, :phone)
json.leader_of_id (@member.leader_of && @member.leader_of.id)
json.leader_of_name (@member.leader_of && @member.leader_of.name)
json.services @member.services do |service|

	json.(service, :id, :name)

end

json.message @message