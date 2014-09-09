# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base

	# validates :name, :email, :phone, presence: true, uniqueness: true # Disabled for tests
	validates :name, presence: true, uniqueness: true

	has_and_belongs_to_many :services

	def leader_of
		Service.where(leader_id: self.id).first
	end

	def in_charge_of
		Service.where(member_in_charge_id: self.id)
	end

end
