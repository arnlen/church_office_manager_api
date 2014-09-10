json.offices @offices do |office|

  json.id office.id
  json.date office.date.to_date

  json.services office.services do |service|
    json.(service, :id, :name, :task_done, :task_total, :ready)
  end

end