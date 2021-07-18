adopters = Adopter.all.first(5)
adopters.each do |adopter|

    adopter.adoptions.create(
      date: Faker::Date.between(from: '2019-01-23', to: '2021-07-25'),
      pet: Pet.where(adoption_status: false).sample,
      admin_id: 1
    )
  end
