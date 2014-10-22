json.array! @tasks do |task|

	json.(task, :id, :name, :due_date, :completed, :service_id)

end