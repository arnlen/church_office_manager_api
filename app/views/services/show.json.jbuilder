json.(@service, :id, :name, :task_done, :task_total, :task_left, :ready, :leader_id, :member_in_charge_id)

if (@service.leader_id && leader = Member.find(@service.leader_id))
	json.leader_name leader.name
end

if (@service.member_in_charge_id && member = Member.find(@service.leader_id))
	json.member_in_charge_name member.name
end