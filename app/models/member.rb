class Member < ActiveRecord::Base

	validates :name, :email, :phone, presence: true, uniqueness: true

	has_and_belongs_to_many :services

end
