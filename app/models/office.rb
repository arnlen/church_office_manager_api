require 'assets/date_time_mixin'

class Office < ActiveRecord::Base

	validates :date, presence: true

	has_many :services, dependent: :destroy

	# Called by OfficeController
	# Return the next n existing offices or create them if not exist
	def self.next(amount)
		missing_offices = amount.to_i - Office.where("date >= ?", Date.today).count
		create_next(missing_offices) if missing_offices > 0
		Office.where("date >= ?", Date.today).limit(amount)
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


	private

		# Create n next offices
		def self.create_next(missing_offices)

			# Grab the last Office's date in database to continue from this date
			# or start from today's date
			if Office.count > 0
				next_sunday = Office.last.date.advance({ weeks: 1})
			else
				next_sunday = Date.today.extend(DateTimeMixin)
				next_sunday = next_sunday.next_wday(7)
			end

			for i in 0..missing_offices - 1
				office = Office.create!(date: next_sunday.advance({ weeks: i}))
				office.create_services_and_tasks
			end

		end

end