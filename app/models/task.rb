# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  due_date   :string(255)
#  completed  :boolean          default(FALSE)
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base

	validates :name, :due_date, :service_id, presence: true

	belongs_to :service

	before_save(on: :create) do
		self.completed = false if self.completed.nil?
	end

end
