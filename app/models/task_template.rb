# == Schema Information
#
# Table name: task_templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  due_date   :string(255)
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class TaskTemplate < ActiveRecord::Base

	validates :name, :due_date, :service_id, presence: true

	belongs_to :service_template

end
