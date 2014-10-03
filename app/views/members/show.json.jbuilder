json.(@member, :id, :name, :email, :phone)
json.services @member.services do |service|

	json.(service, :id, :name)

end