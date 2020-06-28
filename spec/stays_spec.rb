require "rails_helper"
require 'pry'

RSpec.describe Stay do

  describe "Date validation " do
    it "1. should not validate the stay because end_date is before start_date" do
      tenant_maxime = Tenant.create(email: "maxime@gmail.com")
      studio_paris = Studio.create(name: "Paris", price:1000)

      stay = Stay.new(start_date: '20200101', end_date: '20190101', tenant: tenant_maxime, studio: studio_paris)

      expect(stay).not_to be_valid
    end

    it "2. should validate the stay because start_date is before start_date" do
      tenant_maxime = Tenant.create(email: "maxime@gmail.com")
      studio_paris = Studio.create(name: "Paris", price:1000)

      stay = Stay.new(start_date: '20200113', end_date: '20200204', tenant: tenant_maxime, studio: studio_paris)

      expect(stay).to be_valid
    end
  end

  describe "Not free" do
    it "3. should not validate - new start_date is after initial start_date and before end_date" do
      tenant_maxime = Tenant.create(email: "maxime@gmail.com")
      studio_paris = Studio.create(name: "Paris", price: 1000)

      Stay.create(start_date: '20200110', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

      stay = Stay.new(start_date: '20200111', end_date: '20200120', tenant: tenant_maxime, studio: studio_paris)

      expect(stay).not_to be_valid
    end


    it "4. should not validate the stay because it's already occupied - with other tenant" do
      tenant_maxime = Tenant.create(email: "maxime@gmail.com")
      tenant_sylvie = Tenant.create(email: "sylvie@gmail.com")
      studio_paris = Studio.create(name: "Paris", price:1000)

      Stay.create(start_date: '20200101', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

      stay = Stay.new(start_date: '20200102', end_date: '20200204', tenant: tenant_sylvie, studio: studio_paris)

      expect(stay).not_to be_valid
    end
  end

  describe "It's free" do
    it "5. should validate the stay because it's free" do
      tenant_maxime = Tenant.create(email: "maxime@gmail.com")
      tenant_sylvie = Tenant.create(email: "sylvie@gmail.com")
      studio_paris = Studio.create(name: "Paris", price:1000)

      Stay.create(start_date: '20200101', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

      stay = Stay.new(start_date: '20200113', end_date: '20200204', tenant: tenant_sylvie, studio: studio_paris)

      expect(stay).to be_valid
    end

    it "6. should validate the stay - Booking another city" do
      tenant_maxime = Tenant.create(email: "maxime@gmail.com")
      tenant_sylvie = Tenant.create(email: "sylvie@gmail.com")
      studio_paris = Studio.create(name: "Paris", price:1000)
      studio_berlin = Studio.create(name: "Berlin", price:1100)

      Stay.create(start_date: '20200101', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

      stay = Stay.new(start_date: '20200101', end_date: '20200113', tenant: tenant_sylvie, studio: studio_berlin)

      expect(stay).to be_valid
    end
  end

end



