class Service < ActiveRecord::Base

	validates :name, :leader_id, :office_id, presence: true

	belongs_to :office
	has_many :tasks
	has_and_belongs_to_many :members

end
