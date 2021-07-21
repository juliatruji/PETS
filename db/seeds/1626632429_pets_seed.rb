(1..166).each do |id|
  Pet.create(
    name: Faker::Artist.name,
    race: ["Shitzu", "Snauzer", "jack russell terrier", "pastor alemán", "fox terrier toy", "yorkshire terrier", "chihuahua", "pastor alemán", "akita inu", "labrador retriever", "bulldog", "bóxer"].sample,
    gender: %w[hembra macho].sample,
    color: %w[Blanco Plomo Griss Negro Dorado Guinda Naranja Cafe Rata].sample,
    sterilized: [true, false].sample,
    size: %w[Grande Mediano Pequeño Gigante].sample,
    adoption_status: [false].sample
  )
end
