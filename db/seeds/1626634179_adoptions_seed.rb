adopters = Adopter.all.sample(75)
adopters.each do |adopter|
  pet = Pet.where(adoption_status: false).sample
  adopter.adoptions.create(
    date: Faker::Date.between(from: '2019-01-23', to: '2021-07-25'),
    pet: pet,
    admin_id: 1
  )
  pet.update(adoption_status: true)
end
