# == Schema Information
#
# Table name: service_templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  leader_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class ServiceTemplate < ActiveRecord::Base

	validates :name, :leader_id, presence: true

	has_many :task_templates

end
