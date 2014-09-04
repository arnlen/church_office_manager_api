class Member < ActiveRecord::Base

	# validates :name, :email, :phone, presence: true, uniqueness: true # Disabled for tests
	validates :name, presence: true, uniqueness: true

	has_and_belongs_to_many :services

	def leader_of
		Service.where(leader_id: self.id).first
	end

end
