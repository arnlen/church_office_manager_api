class Task < ActiveRecord::Base

	validates :name, :due_date, :service_id, presence: true

	belongs_to :service

end
