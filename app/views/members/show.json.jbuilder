json.name @member.name
json.email @member.email
json.phone @member.phone
json.leader_of Service.find(@member.leader_of).name