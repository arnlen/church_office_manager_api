# == Schema Information
#
# Table name: offices
#
#  id         :integer          not null, primary key
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'assets/date_time_mixin'

class Office < ActiveRecord::Base

	validates :date, presence: true

	has_many :services, dependent: :destroy

	# Called by OfficeController
	# Return the next existing office after the date passed in params or create it if not exist
	def self.get_next(date)
		next_office = Office.where("date > ?", date).first || create_next(date)
	end

	def self.get_previous(date)
		previous_office = Office.where("date < ?", date).last
	end

	# Create services and tasks for the office
	def create_services_and_tasks

		# Create services
		ServiceTemplate.all.each do |service_template|
			new_service = Service.create!(
				name: service_template.name,
				leader_id: service_template.leader_id,
				office_id: self.id)

			# Create tasks
			task_templates = TaskTemplate.where(service_id: service_template.id)
			task_templates.each do |task_template|

				# Determine the exact due_date depending of the office's date
				office_date = self.date.to_date
				monday = office_date.beginning_of_week.extend(DateTimeMixin)

				task_template.due_date = case task_template.due_date
				when "wednesday"
					monday.next_wday(3)
				when "thursday"
					monday.next_wday(4)
				when "friday"
					monday.next_wday(5)
				when "saturday"
					monday.next_wday(6)
				when "sunday"
					monday.next_wday(7)
				end

				Task.create!(
					name: task_template.name,
					due_date: task_template.due_date.to_datetime,
					service_id: new_service.id)

			end # create tasks

			task_total = new_service.tasks.count
			ready = task_total == 0
			new_service.update_attributes(task_left: task_total, task_total: task_total, ready: ready)

		end # create services

	end

	def refresh_services
		self.services.each do |my_service|
			my_service.refresh_counters
		end
	end


	private

		# Create next office
		def self.create_next(date)

			# Find the next sunday
			next_sunday = date.extend(DateTimeMixin)
			next_sunday = next_sunday.next_wday(7)

			# Create Office + its services and tasks
			office = Office.create!(date: next_sunday)
			office.create_services_and_tasks

			office

		end

end
