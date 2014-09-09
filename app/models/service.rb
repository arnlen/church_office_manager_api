# == Schema Information
#
# Table name: services
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  task_left           :integer          default(0)
#  task_done           :integer          default(0)
#  task_total          :integer          default(0)
#  ready               :boolean          default(FALSE)
#  leader_id           :integer
#  member_in_charge_id :integer
#  office_id           :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Service < ActiveRecord::Base

	validates :name, :leader_id, :office_id, presence: true

	belongs_to :office
	belongs_to :leader, class_name: "Member"
	belongs_to :member_in_charge, class_name: "Member"

	has_many :tasks, dependent: :destroy

	has_and_belongs_to_many :members

	def refresh_counters
		task_total = task_left = task_done = 0

		tasks = self.tasks

		tasks.each do |task|
			task_total += 1
			task_left += 1

			if task.completed
				task_left -= 1
				task_done += 1
			end
		end

		ready = task_total == task_done
		self.update_attributes(task_done: task_done, task_left: task_left, task_total: task_total, ready: ready)
	end

end
