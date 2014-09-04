class Task < ActiveRecord::Base

	validates :name, :due_date, :service_id, presence: true

	belongs_to :service

	before_save(on: :create) do
		self.completed = false if self.completed.nil?
	end

end
