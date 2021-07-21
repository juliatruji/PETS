pets = Pet.all.sample(100)
pets.each do |pet|
  pet.veterinary_appointments.create(
    date: Faker::Date.between(from: '2019-01-23', to: '2021-07-25'),
    control_type: %w[Rabia Conjuntivitis Gastritis].sample
  )
end
