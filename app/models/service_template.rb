class ServiceTemplate < ActiveRecord::Base

	validates :name, :leader_id, presence: true

	has_many :task_templates

end
