json.(@member, :name, :email, :phone)
json.leader_of Service.find(@member.leader_of).name