json.(@service, :id, :name, :task_done, :task_total, :task_left, :ready, :leader_id, :member_in_charge_id)

json.leader_name @service.leader.name if @service.leader
json.member_in_charge_name @service.member_in_charge.name if @service.member_in_charge
json.tasks @service.tasks