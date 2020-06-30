# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Database seeding...'

puts 'Deleting all data'
Stay.destroy_all
Tenant.destroy_all
Studio.destroy_all
Discount.destroy_all

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
first_stay = Stay.new(start_date: '20200510', end_date: '20200910' )
first_stay.tenant = maxime
first_stay.studio = barcelone
first_stay.save!

second_stay = Stay.new(start_date: '20190412', end_date: '20200101' )
second_stay.tenant = maxime
second_stay.studio = paris
second_stay.save!

third_stay = Stay.new(start_date: '20200210', end_date: '20200707')
third_stay.tenant = jean
third_stay.studio = paris
third_stay.save!

fourth_stay = Stay.new(start_date: '20200101', end_date: '20201010')
fourth_stay.tenant = alex
fourth_stay.studio = berlin
fourth_stay.save!

fifth_stay = Stay.new(start_date: '20190101', end_date: '20201011')
fifth_stay.tenant = sylvie
fifth_stay.studio = madrid
fifth_stay.save!

puts "Stays created"

puts "Creating Discount"

first_discount = Discount.new(amount: 30, duration: 10, start_discount_date: '20200620')
first_discount.stay = first_stay
first_discount.save!

second_discount = Discount.new(amount: 50, duration: 90 , start_discount_date: '20190710')
second_discount.stay = second_stay
second_discount.save!

puts "Discount created"

puts 'Finished!'
