require "rails_helper"

RSpec.describe Stay do

  it "should not validate the stay because end_date is before start_date" do
    tenant_maxime = Tenant.create(email: "maxime@gmail.com")
    studio_paris = Studio.create(name: "Paris", price:1000)

    stay = Stay.new(start_date: '20200101', end_date: '20190101', tenant: tenant_maxime, studio: studio_paris)

    expect(stay).not_to be_valid
  end

  it "should validate the stay because start_date is before start_date" do
    tenant_maxime = Tenant.create(email: "maxime@gmail.com")
    studio_paris = Studio.create(name: "Paris", price:1000)

    stay = Stay.new(start_date: '20200113', end_date: '20200204', tenant: tenant_maxime, studio: studio_paris)

    expect(stay).to be_valid
  end

  it "should not validate the stay because stay is occupied / already booked" do
    tenant_maxime = Tenant.create(email: "maxime@gmail.com")
    studio_paris = Studio.create(name: "Paris", price: 1000)

    Stay.create(start_date: '20200110', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

    stay = Stay.new(start_date: '20200111', end_date: '20200120', tenant: tenant_maxime, studio: studio_paris)

    expect(stay).not_to be_valid
  end

  it "should validate the stay because it not occupied" do
    tenant_maxime = Tenant.create(email: "maxime@gmail.com")
    studio_paris = Studio.create(name: "Paris", price:1000)

    Stay.create(start_date: '20200110', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

    stay = Stay.new(start_date: '20200201', end_date: '20200204', tenant: tenant_maxime, studio: studio_paris)

    expect(stay).to be_valid
  end

  it "should not validate the stay because it's already occupied" do
    tenant_maxime = Tenant.create(email: "maxime@gmail.com")
    tenant_sylvie = Tenant.create(email: "sylvie@gmail.com")
    studio_paris = Studio.create(name: "Paris", price:1000)

    Stay.create(start_date: '20200101', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

    stay = Stay.new(start_date: '20200102', end_date: '20200204', tenant: tenant_sylvie, studio: studio_paris)

    expect(stay).not_to be_valid
  end

  it "should validate the stay because it's free" do
    tenant_maxime = Tenant.create(email: "maxime@gmail.com")
    tenant_sylvie = Tenant.create(email: "sylvie@gmail.com")
    studio_paris = Studio.create(name: "Paris", price:1000)

    Stay.create(start_date: '20200101', end_date: '20200112', tenant: tenant_maxime, studio: studio_paris)

    stay = Stay.new(start_date: '20200113', end_date: '20200204', tenant: tenant_sylvie, studio: studio_paris)

    expect(stay).to be_valid
  end


end



