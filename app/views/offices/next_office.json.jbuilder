json.offices @offices do |office|

  json.id office.id
  json.date office.date.to_date

  json.services office.services do |service|
    json.id service.id
  	json.name service.name
    json.leader_name Member.find(service.leader_id).name
    json.member_in_charge_name Member.find(service.member_in_charge_id).name
		json.task_left service.task_left
		json.task_done service.task_done
		json.task_total service.task_total
		json.ready service.ready

  	json.tasks service.tasks do |task|
      json.id task.id
  		json.name task.name
  		json.due_date task.due_date.to_date
  		json.completed task.completed
  	end

  end

end