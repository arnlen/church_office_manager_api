class Service < ActiveRecord::Base

	validates :name, :leader_id, :office_id, presence: true

	belongs_to :office
	belongs_to :leader, class_name: "Member"

	has_many :tasks, dependent: :destroy

	has_and_belongs_to_many :members

end
