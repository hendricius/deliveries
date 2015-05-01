# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


company = Company.new
name.company = "Super Firma"
company.password = 1234
company.password_confirmation = 1234
company.email = "test@test.de"
company.address = "Im Schliepas 13, Northeim"
company.contact_person_name = "Benedikt Brendel"
company.description = "Apotheke Roth"
company.auth_token =  "9"
company.save
