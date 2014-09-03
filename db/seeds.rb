# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'assets/date_time_mixin'

# Members
Member.create([
	{ name: "Jeff" },
	{ name: "Mireille" },
	{ name: "JD" },
	{ name: "Wendy" },
	{ name: "Alberte" },
	{ name: "William" },
	{ name: "Amandine" },
	{ name: "Emmanuel" },
	{ name: "Arnaud" },
	{ name: "Franck" },
	{ name: "Didier" },
	{ name: "Nathalie" },
	{ name: "Sylvain" },
	{ name: "Marianne" },
	{ name: "Sharon" },
	{ name: "Jenny" },
	{ name: "Nico" },
	{ name: "Cynthia" },
	{ name: "Albert" },
	{ name: "Alexia" }
])

# Service templates
ServiceTemplate.create([
	{ name: "Louange", leader_id: Member.where(name: "Jeff").first.id },
	{ name: "Accueil", leader_id: Member.where(name: "Nico").first.id },
	{ name: "Projection", leader_id: Member.where(name: "Arnaud").first.id },
	{ name: "Sono", leader_id: Member.where(name: "William").first.id },
	{ name: "Programme", leader_id: Member.where(name: "Didier").first.id },
	{ name: "Prédication", leader_id: Member.where(name: "Emmanuel").first.id },
	{ name: "Garderie", leader_id: Member.where(name: "Nathalie").first.id },
	{ name: "Éveil à la foi", leader_id: Member.where(name: "Sharon").first.id },
	{ name: "Reportage", leader_id: Member.where(name: "Amandine").first.id }
])

# Task templates
TaskTemplate.create([
	{ name: "Créer liste des chants", due_date: "saturday", service_id: ServiceTemplate.where(name: "Louange").first.id },
	{ name: "Imprimer brochure (programme)", due_date: "sunday", service_id: ServiceTemplate.where(name: "Accueil").first.id },
	{ name: "Créer PPT culte", due_date: "saturday", service_id: ServiceTemplate.where(name: "Projection").first.id },
	{ name: "Vérifier Google Drive", due_date: "saturday", service_id: ServiceTemplate.where(name: "Projection").first.id },
	{ name: "Saisir liste des chants dans VideoPsal", due_date: "saturday", service_id: ServiceTemplate.where(name: "Projection").first.id },
	{ name: "Faire balances", due_date: "saturday", service_id: ServiceTemplate.where(name: "Sono").first.id },
	{ name: "Créer brochure (programme)", due_date: "friday", service_id: ServiceTemplate.where(name: "Programme").first.id },
	{ name: "Définir le titre du message", due_date: "friday", service_id: ServiceTemplate.where(name: "Prédication").first.id },
	{ name: "Préparer la leçon", due_date: "saturday", service_id: ServiceTemplate.where(name: "Éveil à la foi").first.id },
])

# Offices
next_sunday = Date.today.extend(DateTimeMixin)
next_sunday = next_sunday.next_wday(7)

Office.create([
	{ date: next_sunday },
	{ date: next_sunday.advance({ weeks: 1 }) },
	{ date: next_sunday.advance({ weeks: 2 }) },
	{ date: next_sunday.advance({ weeks: 3 }) }
])

# Service
service_template = ServiceTemplate.where(name: "Louange").first
new_service = Service.create(name: service_template.name, leader_id: service_template.leader_id, office_id: Office.first.id)

# Tasks for this service
task_templates = TaskTemplate.where(service_id: service_template.id)
task_templates.each do |task_template|

	# Determine the exact due_date depending of the office's date
	office_date = new_service.office.date.to_date
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

	Task.create(name: task_template.name, due_date: task_template.due_date.to_datetime, service_id: new_service.id)
end