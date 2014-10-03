json.array! @services do |service|
  json.(service, :id, :name, :task_done, :task_total, :ready, :leader_id)
end