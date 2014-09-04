require 'assets/date_time_mixin'

class Office < ActiveRecord::Base

	validates :date, presence: true

	has_many :services, dependent: :destroy


	# Called by OfficeController
	def self.next
		Office.where("date >= ?", Date.today).first || Office.create_next
	end

	def self.create_next
		next_sunday = Date.today.extend(DateTimeMixin)
		next_sunday = next_sunday.next_wday(7)

		Office.create(date: next_sunday)
	end

end
