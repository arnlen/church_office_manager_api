json.array! @tasks do |task|

	json.(task, :id, :name, :due_date, :completed)

end