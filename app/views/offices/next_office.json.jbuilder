json.offices @offices do |office|

  json.id office.id
  json.date office.date

  json.services office.services do |service|
  	json.name service.name
    json.leader_name Member.find(service.leader_id).name
		json.task_left service.task_left
		json.task_done service.task_done
		json.task_total service.task_total
		json.ready service.ready

  	json.tasks service.tasks do |task|
  		json.name task.name
  		json.due_date task.due_date
  		json.completed task.completed
  	end

  end

end