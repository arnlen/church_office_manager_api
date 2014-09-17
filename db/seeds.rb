# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8
require 'assets/date_time_mixin'

# ------------------------------
# Create member

Member.create([
	{ name: "Jeff", email: "jeffmarianne.guidon@free.fr", phone: "06 80 83 30 46" },
	{ name: "Mireille", email: "mireille1806@live.fr" },
	{ name: "JD", email: "jdalex.picard@free.fr", phone: "07 71 00 67 40" },
	{ name: "Wendy", email: "weguglielmi@gmail.com", phone: "06 34 71 18 41" },
	{ name: "Alberte" },
	{ name: "William", email: "william.burt@laposte.net", phone: "06 69 25 76 33" },
	{ name: "Amandine", email: "amandina.guglielmi@gmail.com", phone: "06 51 91 54 60" },
	{ name: "Emmanuel", email: "emguglielmi@gmail.com", phone: "06 08 98 83 32" },
	{ name: "Arnaud", email: "arlenglet@gmail.com", phone: "06 72 48 27 41" },
	{ name: "Franck", email: "sabourinfranck@hotmail.com", phone: "06 82 55 33 80" },
	{ name: "Didier", email: "kovu78@hotmail.com", phone: "06 12 90 49 14" },
	{ name: "Nathalie", email: "nathalielefebvre14@sfr.fr", phone: "06 25 19 05 67" },
	{ name: "Sylvain" },
	{ name: "Marianne", email: "jeffmarianne.guidon@free.fr", phone: "06 86 86 98 67" },
	{ name: "Sharon", email: "sharon.guglielmi@free.fr", phone: "06 14 29 30 74" },
	{ name: "Jenny", email: "jennyguglielmi@hotmail.fr", phone: "06 50 06 09 67" },
	{ name: "Nico" },
	{ name: "Cynthia", email: "cynthia.mada@hotmail.fr", phone: "06 52 09 11 49" },
	{ name: "Albert" },
	{ name: "Alexia", email: "alexia.mateta@gmail.com", phone: "06 33 37 96 85" }
])

# ------------------------------
# Create ServiceTemplates

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

# ------------------------------
# Create TaskTemplates

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