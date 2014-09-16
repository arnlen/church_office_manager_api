json.(@member, :name, :email, :phone)
json.leader_of_id @member.leader_of.id
json.leader_of_name Service.find(@member.leader_of).name
json.services @member.services do |service|

	json.(service, :id, :name)

end