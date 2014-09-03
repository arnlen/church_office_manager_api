class Office < ActiveRecord::Base

	validates :date, presence: true

	has_many :services

end
