# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Database seeding...'

puts 'Deleting all data'
Stay.delete_all
Tenant.delete_all
Studio.delete_all

puts 'Creating tenants'

maxime = Tenant.create!(email: "maxime@gmail.com")
jean = Tenant.create!(email: "jean@gmail.com")
sylvie = Tenant.create!(email: "sylvie@gmail.com")
alex = Tenant.create!(email: "alex@gmail.com")
julie = Tenant.create!(email: "julie@gmail.com")

puts 'Tenants created !'


puts' Creating studios'
paris = Studio.create!(name: "Paris", price: 1500)
barcelone = Studio.create!(name: "Barcelone", price: 1200)
madrid = Studio.create!(name: "Mardid", price: 1000)
berlin = Studio.create!(name: "Berlin", price: 900)
rome = Studio.create!(name: "Rome", price: 800)

puts "Studios created"

puts "Creating Stays"
first_stay = Stay.new(start_date: 20200510, duration: 95)
first_stay.tenant = maxime
first_stay.studio = barcelone
first_stay.save!

second_stay = Stay.new(start_date: 20190412, duration: 15)
second_stay.tenant = maxime
second_stay.studio = paris
second_stay.save!

third_stay = Stay.new(start_date: 20200210, duration: 33)
third_stay.tenant = jean
third_stay.studio = paris
third_stay.save!

fourth_stay = Stay.new(start_date: 20200101, duration: 43)
fourth_stay.tenant = alex
fourth_stay.studio = berlin
fourth_stay.save!

fifth_stay = Stay.new(start_date: 20190101, duration: 160)
fifth_stay.tenant = sylvie
fifth_stay.studio = madrid
fourth_stay.save!

puts "Stays created"


puts 'Finished!'
