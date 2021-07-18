(1..10).each do |id|
    Adopter.create(
        name: Faker::Name.name,
        dni: Faker::IDNumber.valid,
        cel: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      age: rand(18..60)
    )
  end